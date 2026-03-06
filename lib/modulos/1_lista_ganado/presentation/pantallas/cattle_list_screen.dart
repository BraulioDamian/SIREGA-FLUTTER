import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/widgets/animal_card.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/widgets/animal_card_skeleton.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/pantallas/cattle_detail_screen.dart';
// Importar enums
import 'package:sirega_app/nucleo/modelos/animal_model.dart'; // Importar Animal

class CattleListScreen extends StatefulWidget {
  const CattleListScreen({super.key});

  @override
  State<CattleListScreen> createState() => _CattleListScreenState();
}

class _CattleListScreenState extends State<CattleListScreen>
    with SingleTickerProviderStateMixin {
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Activos'),
                  Tab(text: 'Historial'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CattleListBloc, CattleListState>(
        builder: (context, state) {
          if (state.loading &&
              state.activeItems.isEmpty &&
              state.historicalItems.isEmpty) {
            return ListView.builder(
              itemCount: 6, // Show 6 skeleton items
              itemBuilder: (context, index) => const AnimalCardSkeleton(),
            );
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text('Error: ${state.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<CattleListBloc>().add(LoadCattle()),
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
              _buildAnimalList(
                state.historicalItems,
                context,
              ), // Pestaña Historial
            ],
          );
        },
      ),
    );
  }

  Widget _buildAnimalList(List<Animal> animals, BuildContext context) {
    if (animals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pets,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No hay animales en esta categoría',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CattleListBloc>().add(LoadCattle());
        // Esperar un poco para que se complete la carga
        await Future.delayed(const Duration(milliseconds: 500));
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return AnimalCard(
            key: ValueKey(animal.id), // Key para forzar actualización
            animal: animal,
            onTap: () async {
              // Esperar a que regrese de la pantalla de detalle
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CattleDetailScreen(id: animal.id),
                ),
              );

              // Recargar la lista cuando regrese
              if (context.mounted) {
                context.read<CattleListBloc>().add(LoadCattle());
              }
            },
          );
        },
      ),
    );
  }
}
