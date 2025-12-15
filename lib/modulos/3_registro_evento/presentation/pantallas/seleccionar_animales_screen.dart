import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/confirmacion_evento_screen.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

enum ScannerMode { none, mobile, external }

class SeleccionarAnimalesScreen extends StatefulWidget {
  final TipoEvento tipoEvento;
  final String producto;
  final DateTime fecha;
  final double? dosis;
  final String? unidadDosis;
  final String? veterinario;
  final String? notas;

  const SeleccionarAnimalesScreen({
    super.key,
    required this.tipoEvento,
    required this.producto,
    required this.fecha,
    this.dosis,
    this.unidadDosis,
    this.veterinario,
    this.notas,
  });

  @override
  State<SeleccionarAnimalesScreen> createState() =>
      _SeleccionarAnimalesScreenState();
}

class _SeleccionarAnimalesScreenState extends State<SeleccionarAnimalesScreen> {
  final Set<int> _selectedAnimalIds = {};
  bool _selectAll = false;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  int? _lastScannedAnimalId;
  ScannerMode _activeScanner = ScannerMode.none;
  String _searchQuery = '';

  Map<String, dynamic> _getEventTypeDetails() {
    switch (widget.tipoEvento) {
      case TipoEvento.vacuna:
        return {'color': Colors.green};
      case TipoEvento.desparasitante:
        return {'color': Colors.orange};
      case TipoEvento.tratamiento:
        return {'color': Colors.blue};
      case TipoEvento.revisionVeterinaria:
        return {'color': Colors.teal};
      case TipoEvento.castracion:
        return {'color': Colors.purple};
      default:
        return {'color': Colors.grey};
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CattleListBloc>().add(LoadCattle());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    context.read<NfcScannerBloc>().add(ResetNfcScannerEvent());
    context.read<Esp32ScannerBloc>().add(DisconnectFromEsp32Event());
    super.dispose();
  }

  void _onAnimalScanned(Animal animal) {
    if (!mounted) return;

    setState(() {
      _selectedAnimalIds.add(animal.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Animal escaneado: ${animal.nombre}. Total seleccionados: ${_selectedAnimalIds.length}'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );

    final cattleState = context.read<CattleListBloc>().state;
    final animals = cattleState.activeItems;
    final index = animals.indexWhere((a) => a.id == animal.id);

    if (index != -1) {
      _scrollController.animateTo(
        index * 80.0, // Approximate height of a ListTile with image
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventDetails = _getEventTypeDetails();
    final primaryColor = eventDetails['color'] as Color;

    return MultiBlocListener(
      listeners: [
        BlocListener<NfcScannerBloc, NfcScannerState>(
          listener: (context, state) {
            if (state is NfcAnimalFound) {
              _onAnimalScanned(state.animal);
            } else if (state is NfcScanError) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error de escaneo: ${state.errorMessage}'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        ),
        BlocListener<Esp32ScannerBloc, Esp32ScannerState>(
          listener: (context, state) {
            if (state is Esp32AnimalFound) {
              _onAnimalScanned(state.animal);
            } else if (state is Esp32Error) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error de ESP32: ${state.errorMessage}'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text('Seleccionar Animales'),
          elevation: 0,
          centerTitle: true,
          actions: [
            if (_selectedAnimalIds.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_selectedAnimalIds.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        body: Column(
          children: [
            _buildScannerRow(primaryColor),
            _buildAnimalList(primaryColor),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _selectedAnimalIds.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ConfirmacionEventoScreen(
                              tipoEvento: widget.tipoEvento,
                              producto: widget.producto,
                              fecha: widget.fecha,
                              dosis: widget.dosis,
                              unidadDosis: widget.unidadDosis,
                              veterinario: widget.veterinario,
                              notas: widget.notas,
                              animalesIds: _selectedAnimalIds.toList(),
                            ),
                          ),
                        );
                      }
                    : null,
                icon: const Icon(Icons.check_circle_outline, size: 24),
                label: Text(
                  _selectedAnimalIds.isEmpty
                      ? 'Selecciona al menos un animal'
                      : 'Registrar Evento (${_selectedAnimalIds.length})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScannerRow(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Métodos de Escaneo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildScannerSection(
                  title: 'Escáner Móvil',
                  icon: Icons.nfc,
                  scannerMode: ScannerMode.mobile,
                  primaryColor: primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildScannerSection(
                  title: 'Lector Externo',
                  icon: Icons.wifi,
                  scannerMode: ScannerMode.external,
                  primaryColor: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScannerSection({
    required String title,
    required IconData icon,
    required ScannerMode scannerMode,
    required Color primaryColor,
  }) {
    final bool isActive = _activeScanner == scannerMode;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isActive) {
            _activeScanner = ScannerMode.none;
            if (scannerMode == ScannerMode.mobile) {
              context.read<NfcScannerBloc>().add(ResetNfcScannerEvent());
            } else {
              context.read<Esp32ScannerBloc>().add(DisconnectFromEsp32Event());
            }
          } else {
            _activeScanner = scannerMode;
            if (scannerMode == ScannerMode.mobile) {
              context.read<NfcScannerBloc>().add(ScanNfcEvent());
            } else {
              context.read<Esp32ScannerBloc>().add(ConnectToEsp32Event());
            }
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 140,
        decoration: BoxDecoration(
          color: isActive ? primaryColor.withAlpha(30) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? primaryColor : Colors.grey[300]!,
            width: isActive ? 3 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive ? primaryColor.withAlpha(50) : Colors.black12,
              blurRadius: isActive ? 12 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScannerAnimation(
                icon: icon,
                isActive: isActive,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isActive ? primaryColor : Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                isActive ? 'Activo' : 'Toca para activar',
                style: TextStyle(
                  fontSize: 11,
                  color: isActive ? primaryColor : Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalList(Color primaryColor) {
    return Expanded(
      child: Column(
        children: [
          // Barra de búsqueda mejorada
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o arete...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: Icon(Icons.search, color: primaryColor),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<CattleListBloc, CattleListState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return Center(child: Text('Error: ${state.error}'));
                }

                // Filtrar animales según la búsqueda
                final allAnimals = state.activeItems;
                final animals = _searchQuery.isEmpty
                    ? allAnimals
                    : allAnimals.where((animal) {
                        return animal.nombre.toLowerCase().contains(_searchQuery) ||
                            animal.idSinigaParaMostrar.toLowerCase().contains(_searchQuery);
                      }).toList();

                if (animals.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No se encontraron animales',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: animals.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CheckboxListTile(
                          tileColor: primaryColor.withAlpha(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: Text(
                            'Seleccionar Todos (${animals.length})',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          value: _selectAll,
                          onChanged: (bool? value) {
                            setState(() {
                              _selectAll = value!;
                              _selectedAnimalIds.clear();
                              if (_selectAll) {
                                _selectedAnimalIds.addAll(animals.map((a) => a.id).toSet());
                              }
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      );
                    }

                    final animal = animals[index - 1];
                    final isSelected = _selectedAnimalIds.contains(animal.id);

                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      elevation: isSelected ? 4 : 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: isSelected
                            ? BorderSide(color: primaryColor, width: 2)
                            : BorderSide.none,
                      ),
                      child: CheckboxListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        secondary: CircleAvatar(
                          radius: 28,
                          backgroundColor: primaryColor.withAlpha(30),
                          backgroundImage: animal.fotoPerfilUrl != null
                              ? NetworkImage(animal.fotoPerfilUrl!)
                              : null,
                          child: animal.fotoPerfilUrl == null
                              ? Icon(Icons.pets, size: 28, color: primaryColor)
                              : null,
                        ),
                        title: Text(
                          animal.nombre,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Arete: ${animal.idSinigaParaMostrar}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        value: isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              _selectedAnimalIds.add(animal.id);
                            } else {
                              _selectedAnimalIds.remove(animal.id);
                              _selectAll = false;
                            }
                          });
                        },
                        activeColor: primaryColor,
                        checkColor: Colors.white,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerAnimation extends StatefulWidget {
  final IconData icon;
  final bool isActive;
  final Color primaryColor;

  const ScannerAnimation({
    super.key,
    required this.icon,
    required this.isActive,
    required this.primaryColor,
  });

  @override
  _ScannerAnimationState createState() => _ScannerAnimationState();
}

class _ScannerAnimationState extends State<ScannerAnimation> with TickerProviderStateMixin {
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    if (widget.isActive) {
      _rippleController.repeat();
    }
  }

  @override
  void didUpdateWidget(ScannerAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _rippleController.repeat();
      } else {
        _rippleController.stop();
      }
    }
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: CustomPaint(
        painter: RipplePainter(
          ripple: _rippleController,
          isActive: widget.isActive,
          color: widget.primaryColor,
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: 32,
            color: widget.isActive ? widget.primaryColor : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  final Animation<double> ripple;
  final bool isActive;
  final Color color;

  RipplePainter({
    required this.ripple,
    required this.isActive,
    required this.color,
  }) : super(repaint: ripple);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    if (isActive) {
      final ripplePaint1 = Paint()
        ..color = color.withAlpha((255 * (1 - ripple.value)).toInt())
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;

      canvas.drawCircle(center, radius * ripple.value, ripplePaint1);

      final delayedRippleValue = (ripple.value - 0.5).clamp(0.0, 1.0);
      final ripplePaint2 = Paint()
        ..color = color.withAlpha((255 * (1 - delayedRippleValue)).toInt())
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;
      canvas.drawCircle(center, radius * delayedRippleValue, ripplePaint2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
