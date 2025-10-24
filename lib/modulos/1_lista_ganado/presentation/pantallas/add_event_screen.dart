// lib/modulos/3_registro_evento/presentation/pantallas/add_event_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/producto_catalogo_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class AddEventScreen extends StatefulWidget {
  final Animal animal;
  const AddEventScreen({super.key, required this.animal});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  Prioridad _prioridad = Prioridad.baja;
  ProductoCatalogo? _productoSeleccionado;
  final _productoPersonalizadoController = TextEditingController();
  final _dosisController = TextEditingController();
  final _notasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Evento Sanitario')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Prioridad', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            SegmentedButton<Prioridad>(
              segments: const [
                ButtonSegment(value: Prioridad.baja, label: Text('Baja'), icon: Icon(Icons.check_circle_outline)),
                ButtonSegment(value: Prioridad.media, label: Text('Media'), icon: Icon(Icons.warning_amber_rounded)),
                ButtonSegment(value: Prioridad.alta, label: Text('Alta'), icon: Icon(Icons.error_outline_rounded)),
              ],
              selected: {_prioridad},
              onSelectionChanged: (newSelection) => setState(() => _prioridad = newSelection.first),
            ),
            const SizedBox(height: 24),
            FutureBuilder<List<ProductoCatalogo>>(
              future: IsarService.isar.productoCatalogos.where().findAll(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return DropdownButtonFormField<ProductoCatalogo>(
                  decoration: const InputDecoration(labelText: 'Producto del Catálogo', border: OutlineInputBorder()),
                  initialValue: _productoSeleccionado,
                  items: snapshot.data!.map((p) => DropdownMenuItem(value: p, child: Text(p.nombre))).toList(),
                  onChanged: (val) => setState(() => _productoSeleccionado = val),
                );
              },
            ),
            const SizedBox(height: 16),
            TextFormField(controller: _productoPersonalizadoController, decoration: const InputDecoration(labelText: 'o Nombre de Producto Personalizado', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextFormField(controller: _dosisController, decoration: const InputDecoration(labelText: 'Dosis', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextFormField(controller: _notasController, decoration: const InputDecoration(labelText: 'Notas Adicionales', border: OutlineInputBorder())),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Guardar Evento'),
              onPressed: () {
                String nombreFinalProducto = _productoPersonalizadoController.text.isNotEmpty
                    ? _productoPersonalizadoController.text
                    : _productoSeleccionado?.nombre ?? 'No especificado';
                if(nombreFinalProducto == 'No especificado'){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Debe seleccionar o escribir un producto.'), backgroundColor: Colors.red));
                  return;
                }
                final nuevoEvento = EventoSanitario()
                  ..prioridad = _prioridad
                  ..tipo = _productoSeleccionado?.tipo ?? TipoEvento.tratamiento
                  ..fecha = DateTime.now()
                  ..nombreProducto = nombreFinalProducto
                  ..dosis = _dosisController.text
                  ..notas = _notasController.text;
                isarService.guardarEvento(nuevoEvento, widget.animal);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}