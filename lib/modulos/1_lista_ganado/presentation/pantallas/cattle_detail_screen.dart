// lib/modulos/2_detalle_animal/presentation/pantallas/cattle_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/add_event_screen.dart';

class CattleDetailScreen extends StatelessWidget {
  final int animalId;
  const CattleDetailScreen({super.key, required this.animalId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CattleDetailBloc(
        isarService: RepositoryProvider.of<IsarService>(context),
      )..add(LoadCattleDetail(animalId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detalle del Animal')),
        body: BlocBuilder<CattleDetailBloc, CattleDetailState>(
          builder: (context, state) {
            if (state is CattleDetailLoaded) {
              final animal = state.animal;
              final eventos = state.eventos;
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(animal.nombre, style: Theme.of(context).textTheme.headlineMedium),
                  Text('${animal.raza} - ${animal.sexo.name}'),
                  const Divider(height: 32),
                  Text('Eventos Sanitarios', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  if (eventos.isEmpty) const Text('No hay eventos registrados.'),
                  ...eventos.map((evento) {
                    final Color colorPrioridad;
                    switch (evento.prioridad) {
                      case Prioridad.alta: colorPrioridad = Colors.red.shade400; break;
                      case Prioridad.media: colorPrioridad = Colors.orange.shade400; break;
                      default: colorPrioridad = Colors.green.shade400;
                    }
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: colorPrioridad, child: const Icon(Icons.vaccines, color: Colors.white)),
                        title: Text(evento.nombreProducto),
                        subtitle: Text('Fecha: ${evento.fecha.toLocal().toString().substring(0, 10)}'),
                        trailing: Text(evento.prioridad.name, style: TextStyle(color: colorPrioridad, fontWeight: FontWeight.bold)),
                      ),
                    );
                  }),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: BlocBuilder<CattleDetailBloc, CattleDetailState>(
          builder: (context, state) {
            if (state is CattleDetailLoaded) {
              return FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                label: const Text('Evento'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AddEventScreen(animal: state.animal)))
                  .then((_) {
                    if (context.mounted) {
                      context.read<CattleDetailBloc>().add(LoadCattleDetail(animalId));
                    }
                  });
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}