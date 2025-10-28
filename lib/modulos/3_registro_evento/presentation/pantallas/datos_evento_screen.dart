import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/seleccionar_animales_screen.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/repositories/nfc_repository_impl.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/animal_database_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/nfc_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/finish_nfc_scan_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/scan_nfc_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/repositories/esp32_repository_impl.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/esp32_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/disconnect_from_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/find_animal_by_uid_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/open_wifi_settings_use_case.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

const Map<TipoEvento, List<String>> _sugerenciasPorTipo = {
  TipoEvento.vacuna: [
    'Complejo Respiratorio (IBR, DVB, PI3, VRSB)',
    'Clostridial 8 vías',
    'Rabia Paralítica (Derriengue)',
    'Brucelosis Cepa RB51',
    'Leptospirosis',
    'Fiebre Aftosa',
  ],
  TipoEvento.desparasitante: [
    'Ivermectina',
    'Doramectina',
    'Fenbendazol',
    'Albendazol',
    'Eprinomectina (sin retiro en leche)',
    'Baño de Inmersión (Garrapaticida)',
    'Pour-on (Mosquicida/Garrapaticida)',
  ],
  TipoEvento.tratamiento: [
    'Antibiótico (Penicilina)',
    'Antibiótico (Oxitetraciclina)',
    'Antiinflamatorio (Flunixin)',
    'Suero vitaminado',
    'Calcio',
  ],
  TipoEvento.revisionVeterinaria: [],
  TipoEvento.castracion: [],
};

const Map<TipoEvento, List<String>> _refuerzosPorTipo = {
  TipoEvento.vacuna: [
    'Refuerzo Anual Complejo Respiratorio',
    'Refuerzo Semestral Clostridial',
  ],
  TipoEvento.desparasitante: [
    'Rotación de Desparasitante (Semestral)',
  ],
  TipoEvento.tratamiento: [],
  TipoEvento.revisionVeterinaria: [],
  TipoEvento.castracion: [],
};

class DatosEventoScreen extends StatefulWidget {
  final TipoEvento tipoEvento;

  const DatosEventoScreen({super.key, required this.tipoEvento});

  @override
  State<DatosEventoScreen> createState() => _DatosEventoScreenState();
}

class _DatosEventoScreenState extends State<DatosEventoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productoController = TextEditingController();
  final _fechaController = TextEditingController();
  final _dosisController = TextEditingController();
  final _veterinarioController = TextEditingController();
  final _notasController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedUnit = 'ml';

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
    super.dispose();
  }

  Future<String?> _showAddNuevoProductoDialog(BuildContext context) {
    final newProductController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
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
              onPressed: () {
                Navigator.of(context).pop(newProductController.text);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de ${widget.tipoEvento.name}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Información del Evento', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 20),
              TypeAheadField<String>(
                builder: (context, controller, focusNode) {
                  return TextFormField(
                    controller: _productoController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: 'Producto *',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un producto';
                      }
                      return null;
                    },
                  );
                },
                suggestionsCallback: (pattern) {
                  final suggestions = _sugerenciasPorTipo[widget.tipoEvento] ?? [];
                  final reinforcements = _refuerzosPorTipo[widget.tipoEvento] ?? [];
                  final allProducts = [...suggestions, ...reinforcements];

                  List<String> filtered = [];
                  if (pattern.isEmpty) {
                    filtered = allProducts;
                  } else {
                    filtered = allProducts.where((item) {
                      return item.toLowerCase().contains(pattern.toLowerCase());
                    }).toList();
                  }

                  // Add "add new" option
                  filtered.add("➕ Registrar nuevo producto");
                  return filtered;
                },
                itemBuilder: (context, suggestion) {
                  if (suggestion == "➕ Registrar nuevo producto") {
                     return ListTile(
                      leading: const Icon(Icons.add),
                      title: Text(suggestion.substring(2)),
                    );
                  }
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSelected: (suggestion) async {
                  if (suggestion == "➕ Registrar nuevo producto") {
                    final newProduct = await _showAddNuevoProductoDialog(context);
                    if (newProduct != null && newProduct.isNotEmpty) {
                      _productoController.text = newProduct;
                    } else {
                      _productoController.clear();
                    }
                  } else {
                    _productoController.text = suggestion;
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _fechaController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de Aplicación *',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
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
                      _fechaController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dosisController,
                      decoration: const InputDecoration(
                        labelText: 'Dosis',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && value.isNotEmpty && double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedUnit,
                      items: ['ml', 'mg', 'unidades', 'gotas']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedUnit = value;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Unidad',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _veterinarioController,
                decoration: const InputDecoration(
                  labelText: 'Veterinario',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _notasController,
                decoration: const InputDecoration(
                  labelText: 'Notas',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
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
                                  final esp32Repository = Esp32RepositoryImpl(Esp32Service());
                                  return Esp32ScannerBloc(
                                    ConnectToEsp32UseCase(esp32Repository),
                                    DisconnectFromEsp32UseCase(esp32Repository),
                                    FindAnimalByUidUseCase(animalDbService),
                                    OpenWifiSettingsUseCase(esp32Repository),
                                  );
                                },
                              ),
                            ],
                            child: SeleccionarAnimalesScreen(
                              tipoEvento: widget.tipoEvento,
                              producto: _productoController.text,
                              fecha: _selectedDate!,
                              dosis: double.tryParse(_dosisController.text),
                              unidadDosis: _selectedUnit,
                              veterinario: _veterinarioController.text,
                              notas: _notasController.text,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Continuar ➜'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
