import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/features/cattle_list/presentation/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/features/event_registration/presentation/screens/event_confirmation_screen.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/animal_selection_card.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/nfc_scanner_event.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/nfc_scanner_state.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/scanner_animation.dart';

enum ScannerMode { none, mobile, external }

class SelectAnimalsScreen extends StatefulWidget {
  final TipoEvento type;
  final String productName;
  final DateTime date;
  final double? dose;
  final String? doseUnit;
  final String? veterinarian;
  final String? applicationRoute;
  final DateTime? nextApplicationDate;
  final String? notes;

  const SelectAnimalsScreen({
    super.key,
    required this.type,
    required this.productName,
    required this.date,
    this.dose,
    this.doseUnit,
    this.veterinarian,
    this.applicationRoute,
    this.nextApplicationDate,
    this.notes,
  });

  @override
  State<SelectAnimalsScreen> createState() => _SeleccionarAnimalesScreenState();
}

class _SeleccionarAnimalesScreenState extends State<SelectAnimalsScreen> {
  final Set<int> _selectedAnimalIds = {};
  final Set<int> _nfcScannedIds = {};
  bool _selectAll = false;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  ScannerMode _activeScanner = ScannerMode.none;
  String _searchQuery = '';

  Map<String, dynamic> _getEventTypeDetails() {
    switch (widget.type) {
      case TipoEvento.vacuna:
        return {'color': AppColors.success};
      case TipoEvento.desparasitante:
        return {'color': AppColors.warning};
      case TipoEvento.tratamiento:
        return {'color': AppColors.info};
      case TipoEvento.revisionVeterinaria:
        return {'color': AppColors.secondary};
      case TipoEvento.castracion:
        return {'color': AppColors.error};
      default:
        return {'color': AppColors.textHint};
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
      _nfcScannedIds.add(animal.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.verified_rounded,
              color: AppColors.surface,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${animal.name} verificado por NFC (${_selectedAnimalIds.length} seleccionados)',
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );

    final cattleState = context.read<CattleListBloc>().state;
    final animals = cattleState.activeItems;
    final index = animals.indexWhere((a) => a.id == animal.id);

    if (index != -1) {
      _scrollController.animateTo(
        index * 90.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }
  }

  Future<bool> _confirmNfcDeselection(Animal animal) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: Icon(Icons.verified_rounded, color: AppColors.info, size: 40),
        title: const Text('Animal verificado por NFC'),
        content: Text(
          '"${animal.name}" fue escaneado y verificado por NFC.\n\n¿Estás seguro de que deseas quitarlo de la selección?',
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Sí, quitar'),
          ),
        ],
      ),
    );
    return result ?? false;
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
                  backgroundColor: AppColors.error,
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
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_selectedAnimalIds.length}',
                      style: const TextStyle(
                        color: AppColors.surface,
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
                  foregroundColor: AppColors.surface,
                  disabledBackgroundColor: AppColors.divider,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _selectedAnimalIds.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 300,
                            ),
                            reverseTransitionDuration: const Duration(
                              milliseconds: 250,
                            ),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    EventConfirmationScreen(
                                      type: widget.type,
                                      productName: widget.productName,
                                      date: widget.date,
                                      dose: widget.dose,
                                      doseUnit: widget.doseUnit,
                                      veterinarian: widget.veterinarian,
                                      applicationRoute: widget.applicationRoute,
                                      nextApplicationDate:
                                          widget.nextApplicationDate,
                                      notes: widget.notes,
                                      animalesIds: _selectedAnimalIds.toList(),
                                    ),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  return FadeTransition(
                                    opacity: CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOut,
                                    ),
                                    child: SlideTransition(
                                      position:
                                          Tween<Offset>(
                                            begin: const Offset(0.03, 0),
                                            end: Offset.zero,
                                          ).animate(
                                            CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeOutCubic,
                                            ),
                                          ),
                                      child: child,
                                    ),
                                  );
                                },
                          ),
                        );
                      }
                    : null,
                icon: const Icon(Icons.check_circle_outline_rounded, size: 24),
                label: Text(
                  _selectedAnimalIds.isEmpty
                      ? 'Selecciona al menos un animal'
                      : 'Registrar Evento (${_selectedAnimalIds.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
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
          color: isActive
              ? primaryColor.withValues(alpha: 0.12)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? primaryColor : AppColors.divider,
            width: isActive ? 3 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? primaryColor.withValues(alpha: 0.2)
                  : AppColors.textPrimary.withValues(alpha: 0.12),
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
                  color: isActive ? primaryColor : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                isActive ? 'Activo' : 'Toca para activar',
                style: TextStyle(
                  fontSize: 11,
                  color: isActive ? primaryColor : AppColors.textHint,
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
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por name o arete...',
                hintStyle: const TextStyle(color: AppColors.textHint),
                prefixIcon: Icon(Icons.search, color: primaryColor),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 20),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.divider),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.divider),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
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

                final allAnimals = state.activeItems;
                final animals = _searchQuery.isEmpty
                    ? allAnimals
                    : allAnimals.where((animal) {
                        return animal.name.toLowerCase().contains(
                              _searchQuery,
                            ) ||
                            animal.displaySiniigaId.toLowerCase().contains(
                              _searchQuery,
                            );
                      }).toList();

                if (animals.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 64,
                          color: AppColors.divider,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No se encontraron animales',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
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
                    // Select all row
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectAll = !_selectAll;
                              _selectedAnimalIds.clear();
                              if (_selectAll) {
                                _selectedAnimalIds.addAll(
                                  animals.map((a) => a.id).toSet(),
                                );
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: _selectAll
                                  ? primaryColor.withValues(alpha: 0.08)
                                  : AppColors.surface,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: _selectAll
                                    ? primaryColor
                                    : AppColors.divider,
                                width: _selectAll ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeOut,
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: _selectAll
                                        ? primaryColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: _selectAll
                                          ? primaryColor
                                          : AppColors.divider,
                                      width: 2,
                                    ),
                                  ),
                                  child: _selectAll
                                      ? const Icon(
                                          Icons.check_rounded,
                                          size: 16,
                                          color: AppColors.surface,
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Seleccionar Todos (${animals.length})',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: _selectAll
                                        ? primaryColor
                                        : AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    final animal = animals[index - 1];
                    final isSelected = _selectedAnimalIds.contains(animal.id);
                    final isNfcScanned = _nfcScannedIds.contains(animal.id);

                    return TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 300 + (index * 40)),
                      curve: Curves.easeOutCubic,
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: AnimalSelectionCard(
                        animal: animal,
                        isSelected: isSelected,
                        isNfcScanned: isNfcScanned,
                        accentColor: primaryColor,
                        onChanged: (selected) async {
                          if (!selected && isNfcScanned) {
                            // NFC-scanned: full confirmation dialog
                            final confirmed = await _confirmNfcDeselection(
                              animal,
                            );
                            if (!confirmed) return;
                            if (!mounted) return;
                            setState(() {
                              _selectedAnimalIds.remove(animal.id);
                              _nfcScannedIds.remove(animal.id);
                              _selectAll = false;
                            });
                          } else if (!selected) {
                            // Manual deselection: SnackBar with undo
                            setState(() {
                              _selectedAnimalIds.remove(animal.id);
                              _selectAll = false;
                            });
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${animal.name} removido'),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.all(16),
                                duration: const Duration(seconds: 3),
                                action: SnackBarAction(
                                  label: 'Deshacer',
                                  textColor: AppColors.surface,
                                  onPressed: () {
                                    if (!mounted) return;
                                    setState(() {
                                      _selectedAnimalIds.add(animal.id);
                                    });
                                  },
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              _selectedAnimalIds.add(animal.id);
                            });
                          }
                        },
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
