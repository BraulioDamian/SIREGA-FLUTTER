import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentacion/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentacion/widgets/animal_card.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentacion/pantallas/add_animal_screen.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/pantallas/cattle_detail_screen.dart';
// Importar enums
import 'package:sirega_app/nucleo/modelos/animal_model.dart'; // Importar Animal

class CattleListScreen extends StatefulWidget {
  const CattleListScreen({super.key});

  @override
  State<CattleListScreen> createState() => _CattleListScreenState();
}

class _CattleListScreenState extends State<CattleListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Llama al evento para cargar los datos frescos cuando la pantalla se inicia
    context.read<CattleListBloc>().add(LoadCattle());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Ganado'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CattleListBloc>().add(LoadCattle()),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Activos'),
            Tab(text: 'Historial'),
          ],
        ),
      ),
      body: BlocBuilder<CattleListBloc, CattleListState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text('Error: ${state.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<CattleListBloc>().add(LoadCattle()),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }
          
          return TabBarView(
            controller: _tabController,
            children: [
              _buildAnimalList(state.activeItems, context), // Pestaña Activos
              _buildAnimalList(state.historicalItems, context), // Pestaña Historial
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddAnimalScreen()),
          ).then((_) {
            if (context.mounted) {
              context.read<CattleListBloc>().add(LoadCattle());
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAnimalList(List<Animal> animals, BuildContext context) {
    if (animals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No hay animales en esta categoría',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (_tabController.index == 0) // Solo mostrar en la pestaña de Activos
              const Text('Toca + para agregar tu primer animal'),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        final animal = animals[index];
        return AnimalCard(
          animal: animal,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CattleDetailScreen(id: animal.id),
              ),
            ).then((_) {
              if (context.mounted) {
                context.read<CattleListBloc>().add(LoadCattle());
              }
            });
          },
        );
      },
    );
  }
}
