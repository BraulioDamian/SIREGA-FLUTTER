import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/features/cattle_list/presentation/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/features/event_registration/presentation/screens/select_animals_screen.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/chip_selector.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/condicion_corporal_selector.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/dosis_con_unidad_field.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/event_header_card.dart';
import 'package:sirega_app/features/event_registration/presentation/widgets/product_typeahead_field.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/data/repositories/nfc_repository_impl.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/animal_database_service.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/nfc_service.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/finish_nfc_scan_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/scan_nfc_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/data/repositories/esp32_repository_impl.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/esp32_service.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/esp32_ble_service.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/disconnect_from_esp32_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/find_animal_by_uid_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/open_wifi_settings_use_case.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

// ──────────────────────────────────────────────────────────
// Vías de aplicación por tipo
// ──────────────────────────────────────────────────────────
const Map<TipoEvento, List<String>> _viasAplicacion = {
  TipoEvento.vacuna: ['Subcutánea', 'Intramuscular', 'Oral'],
  TipoEvento.desparasitante: [
    'Inyectable',
    'Oral',
    'Pour-on',
    'Baño de inmersión',
  ],
  TipoEvento.tratamiento: [
    'Subcutánea',
    'Intramuscular',
    'Intravenosa',
    'Oral',
    'Tópica',
  ],
};

const List<String> _metodosCastracion = [
  'Quirúrgico (navaja)',
  'Banda elástica (Elastrador)',
  'Pinza Burdizzo',
];

class EventDataScreen extends StatefulWidget {
  final TipoEvento type;

  const EventDataScreen({super.key, required this.type});

  @override
  State<EventDataScreen> createState() => _DatosEventoScreenState();
}

class _DatosEventoScreenState extends State<EventDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productoController = TextEditingController();
  final _fechaController = TextEditingController();
  final _dosisController = TextEditingController();
  final _veterinarioController = TextEditingController();
  final _notasController = TextEditingController();
  final _diagnosticoController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedUnit = 'ml';
  String? _selectedVia;
  String? _selectedMetodo;
  int? _condicionCorporal;
  bool _requiereRefuerzo = false;
  DateTime? _fechaProximaAplicacion;
  final _fechaRefuerzoController = TextEditingController();

  // ── Field visibility helpers ──
  bool get _showProducto =>
      widget.type == TipoEvento.vacuna ||
      widget.type == TipoEvento.desparasitante ||
      widget.type == TipoEvento.tratamiento;

  bool get _showDosis => _showProducto;

  bool get _showViaAplicacion => _viasAplicacion.containsKey(widget.type);

  bool get _showDiagnostico =>
      widget.type == TipoEvento.tratamiento ||
      widget.type == TipoEvento.revisionVeterinaria;

  bool get _showMetodo => widget.type == TipoEvento.castracion;

  bool get _showCondicionCorporal =>
      widget.type == TipoEvento.revisionVeterinaria;

  bool get _veterinarioRequired =>
      widget.type == TipoEvento.tratamiento ||
      widget.type == TipoEvento.revisionVeterinaria ||
      widget.type == TipoEvento.castracion;

  @override
  void initState() {
    super.initState();
    _fechaController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _productoController.dispose();
    _fechaController.dispose();
    _dosisController.dispose();
    _veterinarioController.dispose();
    _notasController.dispose();
    _diagnosticoController.dispose();
    _fechaRefuerzoController.dispose();
    super.dispose();
  }

  Future<String?> _showAddNuevoProductoDialog(BuildContext context) {
    final newProductController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nuevo Producto'),
        content: TextField(
          controller: newProductController,
          decoration: const InputDecoration(hintText: 'Nombre del producto'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pop(newProductController.text),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getEventTypeDetails() {
    switch (widget.type) {
      case TipoEvento.vacuna:
        return {
          'title': 'Vacunación',
          'icon': Icons.vaccines,
          'color': AppColors.success,
          'subtitle':
              'Registra la vacuna aplicada, la dose y la vía de administración.',
        };
      case TipoEvento.desparasitante:
        return {
          'title': 'Desparasitación',
          'icon': Icons.bug_report,
          'color': AppColors.warning,
          'subtitle':
              'Registra el producto utilizado para el control de parásitos.',
        };
      case TipoEvento.tratamiento:
        return {
          'title': 'Tratamiento',
          'icon': Icons.medical_services,
          'color': AppColors.info,
          'subtitle':
              'Indica el diagnóstico, medicamento y veterinarian responsable.',
        };
      case TipoEvento.revisionVeterinaria:
        return {
          'title': 'Revisión Veterinaria',
          'icon': Icons.health_and_safety,
          'color': AppColors.secondary,
          'subtitle':
              'Documenta el diagnóstico, condición corporal y observaciones.',
        };
      case TipoEvento.castracion:
        return {
          'title': 'Castración',
          'icon': Icons.content_cut,
          'color': AppColors.error,
          'subtitle':
              'Selecciona el método utilizado y el veterinarian responsable.',
        };
      default:
        return {
          'title': 'Evento',
          'icon': Icons.event,
          'color': AppColors.textHint,
          'subtitle': 'Completa la información del evento.',
        };
    }
  }

  String _buildStructuredNotes() {
    final parts = <String>[];
    if (_diagnosticoController.text.isNotEmpty) {
      parts.add('Diagnóstico: ${_diagnosticoController.text}');
    }
    if (_selectedMetodo != null) parts.add('Método: $_selectedMetodo');
    if (_condicionCorporal != null) {
      parts.add('Condición corporal: $_condicionCorporal/5');
    }
    if (_notasController.text.isNotEmpty) parts.add(_notasController.text);
    return parts.join(' | ');
  }

  InputDecoration _inputDecoration({
    required String label,
    String? hint,
    required IconData icon,
    required Color accentColor,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, color: accentColor),
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
        borderSide: BorderSide(color: accentColor, width: 2),
      ),
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventDetails = _getEventTypeDetails();
    final Color accentColor = eventDetails['color'];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Datos de ${eventDetails['title']}'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ── Header ──
              EventHeaderCard(
                title: eventDetails['title'],
                subtitle: eventDetails['subtitle'],
                icon: eventDetails['icon'],
                accentColor: accentColor,
              ),
              const SizedBox(height: 24),

              // ── Diagnóstico (Tratamiento, Revisión) ──
              if (_showDiagnostico) ...[
                TextFormField(
                  controller: _diagnosticoController,
                  decoration: _inputDecoration(
                    label: widget.type == TipoEvento.revisionVeterinaria
                        ? 'Diagnóstico / Resultado *'
                        : 'Diagnóstico / Motivo *',
                    hint: widget.type == TipoEvento.revisionVeterinaria
                        ? 'Ej. Animal sano, sin hallazgos'
                        : 'Ej. Infección respiratoria',
                    icon: Icons.medical_information_outlined,
                    accentColor: accentColor,
                  ),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El diagnóstico es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
              ],

              // ── Producto (Vacuna, Desparasitante, Tratamiento) ──
              if (_showProducto) ...[
                ProductTypeAheadField(
                  controller: _productoController,
                  type: widget.type,
                  accentColor: accentColor,
                  baseDecoration: _inputDecoration(
                    label: '',
                    icon: Icons.inventory_2_outlined,
                    accentColor: accentColor,
                  ),
                  onAddNewProduct: _showAddNuevoProductoDialog,
                  onChanged: () => setState(() {}),
                ),
                const SizedBox(height: 20),
              ],

              // ── Fecha (todos) ──
              TextFormField(
                controller: _fechaController,
                decoration: _inputDecoration(
                  label: 'Fecha *',
                  hint: 'Seleccionar date',
                  icon: Icons.calendar_month_rounded,
                  accentColor: accentColor,
                ),
                readOnly: true,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      _fechaController.text = DateFormat(
                        'dd/MM/yyyy',
                      ).format(pickedDate);
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // ── Método de Castración ──
              if (_showMetodo) ...[
                ChipSelector(
                  label: 'Método de Castración *',
                  icon: Icons.content_cut_rounded,
                  options: _metodosCastracion,
                  selected: _selectedMetodo,
                  accentColor: accentColor,
                  onSelected: (value) =>
                      setState(() => _selectedMetodo = value),
                ),
                const SizedBox(height: 20),
              ],

              // ── Dosis + Unidad ──
              if (_showDosis) ...[
                DosisConUnidadField(
                  controller: _dosisController,
                  selectedUnit: _selectedUnit,
                  accentColor: accentColor,
                  onUnitChanged: (unit) => setState(() => _selectedUnit = unit),
                  baseDecoration: _inputDecoration(
                    label: 'Dosis',
                    hint: '0.0',
                    icon: Icons.science_outlined,
                    accentColor: accentColor,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // ── ¿Requiere refuerzo? (solo vacunas) ──
              if (widget.type == TipoEvento.vacuna) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _requiereRefuerzo
                          ? accentColor.withValues(alpha: 0.4)
                          : AppColors.divider,
                    ),
                  ),
                  child: SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        Icon(
                          _requiereRefuerzo
                              ? Icons.event_repeat_rounded
                              : Icons.check_circle_outline_rounded,
                          color: _requiereRefuerzo
                              ? accentColor
                              : AppColors.textHint,
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '¿Requiere refuerzo?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _requiereRefuerzo
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    value: _requiereRefuerzo,
                    activeTrackColor: accentColor,
                    onChanged: (v) => setState(() {
                      _requiereRefuerzo = v;
                      if (!v) {
                        _fechaProximaAplicacion = null;
                        _fechaRefuerzoController.clear();
                      }
                    }),
                  ),
                ),
                const SizedBox(height: 20),

                // ── Fecha de próximo refuerzo ──
                if (_requiereRefuerzo) ...[
                  TextFormField(
                    controller: _fechaRefuerzoController,
                    decoration: _inputDecoration(
                      label: 'Fecha próximo refuerzo *',
                      hint: 'Seleccionar date',
                      icon: Icons.event_repeat_rounded,
                      accentColor: accentColor,
                    ),
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate:
                            _fechaProximaAplicacion ??
                            DateTime.now().add(const Duration(days: 180)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          _fechaProximaAplicacion = picked;
                          _fechaRefuerzoController.text = DateFormat(
                            'dd/MM/yyyy',
                          ).format(picked);
                        });
                      }
                    },
                    validator: (value) {
                      if (_requiereRefuerzo &&
                          (value == null || value.isEmpty)) {
                        return 'Selecciona la date del próximo refuerzo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ],

              // ── Vía de Aplicación ──
              if (_showViaAplicacion) ...[
                ChipSelector(
                  label: 'Vía de Aplicación',
                  icon: Icons.local_hospital_outlined,
                  options: _viasAplicacion[widget.type] ?? [],
                  selected: _selectedVia,
                  accentColor: accentColor,
                  onSelected: (value) => setState(() => _selectedVia = value),
                ),
                const SizedBox(height: 20),
              ],

              // ── Condición Corporal (Revisión) ──
              if (_showCondicionCorporal) ...[
                CondicionCorporalSelector(
                  selected: _condicionCorporal,
                  accentColor: accentColor,
                  onSelected: (score) =>
                      setState(() => _condicionCorporal = score),
                ),
                const SizedBox(height: 20),
              ],

              // ── Veterinario ──
              TextFormField(
                controller: _veterinarioController,
                decoration: _inputDecoration(
                  label: _veterinarioRequired ? 'Veterinario *' : 'Veterinario',
                  hint: 'Ej. Dr. Juan Pérez',
                  icon: Icons.badge_outlined,
                  accentColor: accentColor,
                ),
                validator: _veterinarioRequired
                    ? (value) {
                        if (value == null || value.isEmpty) {
                          return 'El veterinarian es obligatorio para este evento';
                        }
                        return null;
                      }
                    : null,
              ),
              const SizedBox(height: 20),

              // ── Notas ──
              TextFormField(
                controller: _notasController,
                decoration: _inputDecoration(
                  label: 'Notas',
                  hint: 'Observaciones adicionales',
                  icon: Icons.notes_outlined,
                  accentColor: accentColor,
                ).copyWith(alignLabelWithHint: true),
                maxLines: 3,
              ),
              const SizedBox(height: 32),

              // ── Botón Continuar ──
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _onContinuar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: AppColors.surface,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 24),
                  label: const Text(
                    'Seleccionar Animales',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _onContinuar() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final eventDetails = _getEventTypeDetails();
    final structuredNotes = _buildStructuredNotes();

    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: BlocProvider.of<CattleListBloc>(context),
                ),
                BlocProvider(
                  create: (context) {
                    final isarService = IsarService();
                    final animalDbService = AnimalDatabaseService(isarService);
                    final nfcRepository = NfcRepositoryImpl(
                      NfcService(),
                      animalDbService,
                    );
                    return NfcScannerBloc(
                      ScanNfcUseCase(nfcRepository),
                      FinishNfcScanUseCase(nfcRepository),
                    );
                  },
                ),
                BlocProvider(
                  create: (context) {
                    final isarService = IsarService();
                    final animalDbService = AnimalDatabaseService(isarService);
                    final esp32Repository = Esp32RepositoryImpl(
                      Esp32Service(),
                      Esp32BleService(),
                    );
                    return Esp32ScannerBloc(
                      ConnectToEsp32UseCase(esp32Repository),
                      DisconnectFromEsp32UseCase(esp32Repository),
                      FindAnimalByUidUseCase(animalDbService),
                      OpenWifiSettingsUseCase(esp32Repository),
                      esp32Repository,
                    );
                  },
                ),
              ],
              child: SelectAnimalsScreen(
                type: widget.type,
                productName: _showProducto
                    ? _productoController.text
                    : eventDetails['title'],
                date: _selectedDate!,
                dose: _showDosis
                    ? double.tryParse(_dosisController.text)
                    : null,
                doseUnit: _showDosis ? _selectedUnit : null,
                veterinarian: _veterinarioController.text,
                applicationRoute: _selectedVia,
                nextApplicationDate: _fechaProximaAplicacion,
                notes: structuredNotes,
              ),
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
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
}
