// lib/modulos/1_lista_ganado/presentacion/pantallas/add_animal_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentacion/bloc/cattle_list_bloc.dart';

class AddAnimalScreen extends StatefulWidget {
  const AddAnimalScreen({super.key});
  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _razaController = TextEditingController();
  Sexo _sexoSeleccionado = Sexo.hembra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Nuevo Animal')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre o Número'), validator: (v) => v!.isEmpty ? 'Requerido' : null),
              TextFormField(controller: _razaController, decoration: const InputDecoration(labelText: 'Raza'), validator: (v) => v!.isEmpty ? 'Requerido' : null),
              DropdownButtonFormField<Sexo>(
                initialValue: _sexoSeleccionado,
                decoration: const InputDecoration(labelText: 'Sexo'),
                items: Sexo.values.map((s) => DropdownMenuItem(value: s, child: Text(s.name))).toList(),
                onChanged: (val) => setState(() => _sexoSeleccionado = val!)),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Guardar Animal'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final animal = Animal()
                      ..nombre = _nombreController.text
                      ..raza = _razaController.text
                      ..sexo = _sexoSeleccionado
                      ..fechaNacimiento = DateTime.now()
                      ..estado = EstadoAnimal.activo;
                    context.read<CattleListBloc>().add(AddCattle(animal));
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}