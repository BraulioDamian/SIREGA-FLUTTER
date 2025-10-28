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
  int? _lastScannedAnimalId;
  ScannerMode _activeScanner = ScannerMode.none;

  @override
  void initState() {
    super.initState();
    context.read<CattleListBloc>().add(LoadCattle());
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Seleccionar Animales'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            _buildScannerRow(),
            _buildAnimalList(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
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
            child: Text('Registrar Evento (${_selectedAnimalIds.length})'),
          ),
        ),
      ),
    );
  }

  Widget _buildScannerRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildScannerSection(
              title: 'Escaner Móvil',
              icon: Icons.nfc,
              scannerMode: ScannerMode.mobile,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildScannerSection(
              title: 'Lector Externo',
              icon: Icons.wifi,
              scannerMode: ScannerMode.external,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerSection({
    required String title,
    required IconData icon,
    required ScannerMode scannerMode,
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
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isActive ? Colors.green : Colors.transparent,
              width: 3,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ScannerAnimation(icon: icon, isActive: isActive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalList() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o ID...', 
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                // Lógica de búsqueda
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

                final animals = state.activeItems;

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: animals.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CheckboxListTile(
                        title: Text('Seleccionar Todos (${animals.length})', style: const TextStyle(color: Colors.white)),
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
                      );
                    }

                    final animal = animals[index - 1];
                    final isSelected = _selectedAnimalIds.contains(animal.id);

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        border: isSelected ? Border.all(color: Colors.green, width: 2) : null,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CheckboxListTile(
                        secondary: CircleAvatar(
                          radius: 30,
                          backgroundImage: animal.fotoPerfilUrl != null
                              ? NetworkImage(animal.fotoPerfilUrl!)
                              : null,
                          child: animal.fotoPerfilUrl == null
                              ? const Icon(Icons.pets, size: 30)
                              : null,
                        ),
                        title: Text(animal.nombre, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text('No. Arete: ${animal.idSinigaParaMostrar}', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                        value: isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              _selectedAnimalIds.add(animal.id);
                            } else {
                              _selectedAnimalIds.remove(animal.id);
                            }
                          });
                        },
                        activeColor: Theme.of(context).primaryColor,
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

  const ScannerAnimation({super.key, required this.icon, required this.isActive});

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
      height: 80,
      width: 80,
      child: CustomPaint(
        painter: RipplePainter(
          ripple: _rippleController,
          isActive: widget.isActive,
        ),
        child: Center(child: Icon(widget.icon, size: 40)),
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  final Animation<double> ripple;
  final bool isActive;

  RipplePainter({
    required this.ripple,
    required this.isActive,
  }) : super(repaint: ripple);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    if (isActive) {
      final ripplePaint1 = Paint()
        ..color = Colors.green.withOpacity(1 - ripple.value)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawCircle(center, radius * ripple.value, ripplePaint1);

      final delayedRippleValue = (ripple.value - 0.5).clamp(0.0, 1.0);
      final ripplePaint2 = Paint()
        ..color = Colors.green.withOpacity(1 - delayedRippleValue)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(center, radius * delayedRippleValue, ripplePaint2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
