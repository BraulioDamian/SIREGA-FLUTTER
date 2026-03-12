import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/medical_event_card.dart';

// ── Tab definition ───────────────────────────────────────────────────────────

class _TabDef {
  final String label;
  final TipoEvento? tipo;
  final IconData icon;

  const _TabDef(this.label, this.tipo, this.icon);
}

const _tabs = [
  _TabDef('Todos', null, Icons.list_alt_rounded),
  _TabDef('Vacunas', TipoEvento.vacuna, Icons.vaccines),
  _TabDef('Tratamientos', TipoEvento.tratamiento, Icons.medication),
  _TabDef('Desparasit.', TipoEvento.desparasitante, Icons.bug_report),
  _TabDef('Revisiones', TipoEvento.revisionVeterinaria, Icons.health_and_safety),
  _TabDef('Laboratorio', TipoEvento.muestraLaboratorio, Icons.biotech),
];

// ── Screen ───────────────────────────────────────────────────────────────────

class SanitaryHistoryScreen extends StatefulWidget {
  final int animalId;
  final String animalName;
  final String initialFilter;

  const SanitaryHistoryScreen({
    super.key,
    required this.animalId,
    required this.animalName,
    this.initialFilter = 'Todos',
  });

  @override
  State<SanitaryHistoryScreen> createState() => _SanitaryHistoryScreenState();
}

class _SanitaryHistoryScreenState extends State<SanitaryHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<EventoSanitario>> _dataFuture;

  @override
  void initState() {
    super.initState();
    final initialIndex = _tabs.indexWhere((t) => t.label == widget.initialFilter);
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: initialIndex >= 0 ? initialIndex : 0,
    );
    _dataFuture = RepositoryProvider.of<IsarService>(context)
        .getEventsByAnimal(widget.animalId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  List<EventoSanitario> _filterEvents(List<EventoSanitario> all, TipoEvento? tipo) {
    final list = tipo == null ? List.of(all) : all.where((e) => e.tipo == tipo).toList();
    list.sort((a, b) => b.fecha.compareTo(a.fecha));
    return list;
  }

  Map<String, List<EventoSanitario>> _groupByMonth(List<EventoSanitario> eventos) {
    final map = <String, List<EventoSanitario>>{};
    for (final e in eventos) {
      final key = DateFormat('MMMM yyyy', 'es').format(e.fecha);
      map.putIfAbsent(key, () => []).add(e);
    }
    return map;
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: AppColors.surface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Historial de ${widget.animalName}',
          style: const TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.85),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 0,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.surface.withValues(alpha: 0.2),
              ),
              dividerColor: Colors.transparent,
              labelColor: AppColors.surface,
              unselectedLabelColor: AppColors.surface.withValues(alpha: 0.7),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              tabs: [
                for (final t in _tabs)
                  _SanitaryTabItem(icon: t.icon, label: t.label),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<EventoSanitario>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          if (snapshot.hasError) {
            return _buildEmptyState(
              Icons.error_outline_rounded,
              'Error al cargar',
              'Intenta de nuevo más tarde',
            );
          }

          final allEventos = snapshot.data ?? [];

          return TabBarView(
            controller: _tabController,
            children: [
              for (final t in _tabs)
                _EventListPage(
                  eventos: _filterEvents(allEventos, t.tipo),
                  groupByMonth: _groupByMonth,
                  tab: t,
                  onRefresh: () {
                    setState(() {
                      _dataFuture = RepositoryProvider.of<IsarService>(context)
                          .getEventsByAnimal(widget.animalId);
                    });
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  // ── Empty state (for loading/error only) ───────────────────────────────── 

  Widget _buildEmptyState(IconData icon, String title, String subtitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: AppColors.primary.withValues(alpha: 0.4)),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Tab item (matching cattle_detail_screen style) ───────────────────────────

class _SanitaryTabItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SanitaryTabItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 48,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}

// ── Individual tab page (event list) ─────────────────────────────────────────

class _EventListPage extends StatelessWidget {
  final List<EventoSanitario> eventos;
  final Map<String, List<EventoSanitario>> Function(List<EventoSanitario>) groupByMonth;
  final _TabDef tab;
  final VoidCallback? onRefresh;

  const _EventListPage({
    required this.eventos,
    required this.groupByMonth,
    required this.tab,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (eventos.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(tab.icon, size: 48, color: AppColors.primary.withValues(alpha: 0.4)),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sin registros',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                tab.tipo == null
                    ? 'Aún no hay eventos registrados'
                    : 'Sin registros de "${tab.label}"',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: AppColors.textHint),
              ),
            ],
          ),
        ),
      );
    }

    // ── Vacunas tab: split into "Con refuerzo" / "Única aplicación" ──
    if (tab.tipo == TipoEvento.vacuna) {
      final conRefuerzo = eventos.where((e) => e.fechaProximaAplicacion != null).toList();
      final unicaAplicacion = eventos.where((e) => e.fechaProximaAplicacion == null).toList();

      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildSummaryBar(eventos)),

          // ── Con refuerzo ──
          if (conRefuerzo.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: _buildSectionHeader(
                'Con refuerzo',
                '${conRefuerzo.length}',
                Icons.event_repeat_rounded,
                AppColors.warning,
              ),
            ),
            ..._buildGroupedSlivers(conRefuerzo),
          ],

          // ── Única aplicación (sin agrupar por mes) ──
          if (unicaAplicacion.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: _buildSectionHeader(
                'Única aplicación',
                '${unicaAplicacion.length}',
                Icons.check_circle_outline_rounded,
                AppColors.success,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final evento = unicaAplicacion[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MedicalEventCard(
                      evento: evento,
                      index: index,
                      isLast: index == unicaAplicacion.length - 1,
                      showTypeBadge: false,
                      onDeleted: onRefresh,
                    ),
                  );
                },
                childCount: unicaAplicacion.length,
              ),
            ),
          ],

          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      );
    }

    // ── All other tabs: standard month grouping ──
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: _buildSummaryBar(eventos)),
        ..._buildGroupedSlivers(eventos),
        const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }

  // ── Grouped slivers helper ──────────────────────────────────────────────

  List<Widget> _buildGroupedSlivers(List<EventoSanitario> eventos) {
    final grouped = groupByMonth(eventos);
    return [
      for (final entry in grouped.entries) ...[
        SliverToBoxAdapter(child: _buildMonthHeader(entry.key)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final evento = entry.value[index];
              final isLast = index == entry.value.length - 1;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MedicalEventCard(
                  evento: evento,
                  index: index,
                  isLast: isLast,
                  showTypeBadge: tab.tipo == null,
                  onDeleted: onRefresh,
                ),
              );
            },
            childCount: entry.value.length,
          ),
        ),
      ],
    ];
  }

  // ── Section header (for vaccine sub-groups) ────────────────────────────

  Widget _buildSectionHeader(String title, String count, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: color,
                letterSpacing: 0.3,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              count,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Summary bar ──────────────────────────────────────────────────────────

  Widget _buildSummaryBar(List<EventoSanitario> eventos) {
    final lastDate = eventos.first.fecha;
    final diff = DateTime.now().difference(lastDate).inDays;
    final timeAgo = diff == 0
        ? 'Hoy'
        : diff == 1
            ? 'Ayer'
            : 'Hace $diff días';

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          _summaryChip(
            Icons.event_note_rounded,
            '${eventos.length}',
            'registros',
            AppColors.primary,
          ),
          const Spacer(),
          _summaryChip(
            Icons.schedule_rounded,
            timeAgo,
            'último registro',
            AppColors.info,
          ),
        ],
      ),
    );
  }

  Widget _summaryChip(IconData icon, String value, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.textHint,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── Month header ───────────────────────────────────────────────────────────

  Widget _buildMonthHeader(String month) {
    final capitalized = month[0].toUpperCase() + month.substring(1);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            capitalized,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

}
