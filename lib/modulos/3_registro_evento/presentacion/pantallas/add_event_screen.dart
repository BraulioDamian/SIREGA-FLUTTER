import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentacion/bloc/add_event_bloc.dart';

class AddEventScreen extends StatefulWidget {
  final Animal animal;
  const AddEventScreen({super.key, required this.animal});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreProductoController = TextEditingController();
  final _notasController = TextEditingController();
  DateTime _fecha = DateTime.now();
  Prioridad _prioridad = Prioridad.baja;

  @override
  void dispose() {
    _nombreProductoController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddEventBloc>(
      create: (context) => AddEventBloc(
        isarService: RepositoryProvider.of<IsarService>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Evento para ${widget.animal.nombre}'),
        ),
        body: BlocListener<AddEventBloc, AddEventState>(
          listener: (context, state) {
            if (state is AddEventSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Evento guardado exitosamente')),
              );
              Navigator.pop(context);
            }
            if (state is AddEventError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Animal: ${widget.animal.nombre}'),
                          Text('Raza: ${widget.animal.raza}'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nombreProductoController,
                    decoration: const InputDecoration(
                      labelText: 'Producto/Medicamento',
                      hintText: 'Ej: IVERMECTINA 3.15%',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<Prioridad>(
                    initialValue: _prioridad,
                    decoration: const InputDecoration(labelText: 'Prioridad'),
                    items: Prioridad.values.map((prioridad) {
                      return DropdownMenuItem(
                        value: prioridad,
                        child: Text(prioridad.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _prioridad = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: const Text('Fecha'),
                    subtitle: Text(_fecha.toString().substring(0, 10)),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _fecha,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          _fecha = picked;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _notasController,
                    decoration: const InputDecoration(
                      labelText: 'Notas (opcional)',
                      hintText: 'Observaciones adicionales...',
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<AddEventBloc, AddEventState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: state is AddEventSaving 
                            ? null 
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AddEventBloc>().add(
                                    SaveEvent(
                                      animal: widget.animal,
                                      nombreProducto: _nombreProductoController.text,
                                      fecha: _fecha,
                                      prioridad: _prioridad,
                                      notas: _notasController.text.isEmpty 
                                        ? null 
                                        : _notasController.text,
                                    ),
                                  );
                                }
                              },
                          child: state is AddEventSaving
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Guardar Evento'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
