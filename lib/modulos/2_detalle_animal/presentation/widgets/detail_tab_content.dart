import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/health_status_widget.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/production_charts.dart';

enum TabType { general, health, reproduction, production }

class DetailTabContent extends StatelessWidget {
  // ========== CONFIGURACIÓN CENTRALIZADA DEL PADDING ==========
  // Aquí puedes ajustar todos los valores de padding de una sola vez
  
  // Padding dinámico superior (cambia con el scroll)
  static const double _maxTopPadding = 80.0;  // Padding cuando está contraído
  static const double _minTopPadding = 25.0;   // Padding cuando está expandido
  static const bool _useSmoothCurve = true;   // Usar curva suave para la transición
  
  // Padding estático para los lados y abajo (no cambia con el scroll)
  static const double _horizontalPadding = 16.0;  // Padding izquierdo y derecho
  static const double _bottomPadding = 16.0;      // Padding inferior
  // =============================================================
  
  final Animal animal;
  final TabType tabType;
  final Animation<double> scaleAnimation;
  final bool isScrolled;
  final double scrollPercentage;

  const DetailTabContent({
    super.key,
    required this.animal,
    required this.tabType,
    required this.scaleAnimation,
    required this.isScrolled,
    this.scrollPercentage = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    switch (tabType) {
      case TabType.general:
        return _buildGeneralTab(context);
      case TabType.health:
        return _buildHealthTab(context);
      case TabType.reproduction:
        return _buildReproductionTab(context);
      case TabType.production:
        return _buildProductionTab(context);
    }
  }

  // Método centralizado para calcular el padding dinámico
  double _calculateDynamicPadding() {
    // Aplicar curva suave si está habilitada
    final double progress = _useSmoothCurve 
        ? Curves.easeInOutCubic.transform(scrollPercentage)
        : scrollPercentage;
    
    // Interpola entre el padding mínimo y máximo basado en el progreso
    return _minTopPadding + (progress * (_maxTopPadding - _minTopPadding));
  }
  
  // Método para obtener el EdgeInsets completo con la configuración centralizada
  EdgeInsets _getListPadding() {
    return EdgeInsets.fromLTRB(
      _horizontalPadding,      // izquierda
      _calculateDynamicPadding(), // arriba (dinámico)
      _horizontalPadding,      // derecha
      _bottomPadding,          // abajo
    );
  }
  
  Widget _buildGeneralTab(BuildContext context) {
    return ListView(
      padding: _getListPadding(),
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Información Básica',
          icon: Icons.info_rounded,
          color: Colors.blue,
          delay: 0,
          child: Column(
            children: [
              _buildDetailRow(context, 'Identificación', '#${animal.id}', Icons.tag),
              _buildDetailRow(context, 'Nombre', animal.nombre, Icons.pets),
              _buildDetailRow(context, 'Raza', animal.raza, Icons.category),
              _buildDetailRow(
                context,
                'Sexo',
                animal.sexo.name.toUpperCase(),
                animal.sexo.name == 'macho' ? Icons.male : Icons.female,
                valueColor: animal.sexo.name == 'macho' ? Colors.blue : Colors.pink,
              ),
              _buildDetailRow(
                context,
                'Fecha de Nacimiento',
                _formatDate(animal.fechaNacimiento),
                Icons.cake,
              ),
              _buildDetailRow(
                context,
                'Edad',
                animal.getEdadFormateada(),
                Icons.calendar_today,
                valueColor: Colors.orange,
              ),
              _buildDetailRow(
                context,
                'Estado',
                animal.estado.name.toUpperCase(),
                Icons.check_circle,
                valueColor: _getStatusColor(animal.estado.name),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Identificación Digital',
          icon: Icons.qr_code_scanner,
          color: Colors.purple,
          delay: 100,
          child: Column(
            children: [
              if (animal.idAreteVisual != null)
                _buildDetailRow(
                  context,
                  'Número de Arete',
                  animal.idAreteVisual!,
                  Icons.numbers,
                ),
              if (animal.idAreteNFC != null)
                _buildDetailRow(
                  context,
                  'Código RFID',
                  animal.idAreteNFC!,
                  Icons.nfc,
                ),
              if (animal.idAreteVisual == null && animal.idAreteNFC == null)
                _buildEmptyState('Sin identificación digital registrada'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Genealogía',
          icon: Icons.family_restroom,
          color: Colors.green,
          delay: 200,
          child: Column(
            children: [
              if (animal.madre.value?.id != null)
                _buildDetailRow(
                  context,
                  'Madre',
                  'ID: ${animal.madre.value?.id}',
                  Icons.female,
                  valueColor: Colors.pink,
                ),
              if (animal.padre.value?.id != null)
                _buildDetailRow(
                  context,
                  'Padre',
                  'ID: ${animal.padre.value?.id}',
                  Icons.male,
                  valueColor: Colors.blue,
                ),
              if (animal.madre.value?.id == null && animal.padre.value?.id == null)
                _buildEmptyState('Sin información genealógica'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHealthTab(BuildContext context) {
    return ListView(
      padding: _getListPadding(),
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Estado de Salud',
          icon: Icons.favorite,
          color: Colors.red,
          delay: 0,
          child: Column(
            children: [
              HealthStatusWidget(status: animal.estadoSalud.name),
              const SizedBox(height: 20),
              _buildDetailRow(
                context,
                'Última Revisión',
                animal.fechaUltimaRevision != null
                    ? _formatDate(animal.fechaUltimaRevision!)
                    : 'Sin registros',
                Icons.medical_services,
                valueColor: Colors.teal,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Historial Médico',
          icon: Icons.history,
          color: Colors.teal,
          delay: 100,
          child: _buildMedicalHistory(context),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Vacunas Aplicadas',
          icon: Icons.vaccines,
          color: Colors.orange,
          delay: 200,
          child: _buildVaccinesList(context),
        ),
      ],
    );
  }

  Widget _buildReproductionTab(BuildContext context) {
    return ListView(
      padding: _getListPadding(),
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Estado Reproductivo',
          icon: Icons.child_care,
          color: Colors.pink,
          delay: 0,
          child: Column(
            children: [
              _buildReproductiveStatus(context),
              const SizedBox(height: 20),
              _buildDetailRow(
                context,
                'Último Parto',
                animal.fechaUltimoParto != null
                    ? _formatDate(animal.fechaUltimoParto!)
                    : 'Sin registros',
                Icons.child_friendly,
              ),
              _buildDetailRow(
                context,
                'Número de Partos',
                animal.numeroPartos.toString(),
                Icons.format_list_numbered,
              ),
              if (animal.fechaProximoCelo != null)
                _buildDetailRow(
                  context,
                  'Próximo Celo',
                  _formatDate(animal.fechaProximoCelo!),
                  Icons.schedule,
                  valueColor: Colors.orange,
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Historial de Crías',
          icon: Icons.pets,
          color: Colors.brown,
          delay: 100,
          child: _buildOffspringHistory(context),
        ),
      ],
    );
  }

  Widget _buildProductionTab(BuildContext context) {
    return ListView(
      padding: _getListPadding(),
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Producción de Leche',
          icon: Icons.local_drink,
          color: Colors.blue,
          delay: 0,
          child: Column(
            children: [
              ProductionChart(type: ChartType.milk, animal: animal),
              const SizedBox(height: 20),
              _buildDetailRow(
                context,
                'Promedio Diario',
                '${animal.promedioLecheDiario ?? 0} L/día',
                Icons.water_drop,
                valueColor: Colors.blue,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Control de Peso',
          icon: Icons.monitor_weight,
          color: Colors.green,
          delay: 100,
          child: Column(
            children: [
              ProductionChart(type: ChartType.weight, animal: animal),
              const SizedBox(height: 20),
              _buildDetailRow(
                context,
                'Peso Actual',
                '${animal.pesoActual ?? 0} kg',
                Icons.scale,
                valueColor: Colors.green,
              ),
              _buildDetailRow(
                context,
                'Último Pesaje',
                animal.fechaUltimoPesaje != null
                    ? _formatDate(animal.fechaUltimoPesaje!)
                    : 'Sin registros',
                Icons.calendar_today,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: (valueColor ?? Theme.of(context).primaryColor).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 22,
              color: valueColor ?? Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: valueColor ?? Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.info_outline,
              size: 40,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReproductiveStatus(BuildContext context) {
    if (animal.estadoReproductivo == null) {
      return _buildEmptyState('Sin información reproductiva');
    }
    
    Color statusColor;
    IconData statusIcon;
    String status = animal.estadoReproductivo!.name;
    
    switch (status.toLowerCase()) {
      case 'gestante':
        statusColor = Colors.pink;
        statusIcon = Icons.pregnant_woman;
        break;
      case 'lactando':
        statusColor = Colors.blue;
        statusIcon = Icons.local_drink;
        break;
      case 'seca':
        statusColor = Colors.grey;
        statusIcon = Icons.pause_circle;
        break;
      default:
        statusColor = Colors.orange;
        statusIcon = Icons.help_outline;
    }
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            statusColor.withOpacity(0.15),
            statusColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(statusIcon, color: statusColor, size: 36),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estado Actual',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              Text(
                status.toUpperCase(),
                style: TextStyle(
                  color: statusColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalHistory(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<EventoSanitario>>(
      future: isarService.obtenerEventosPorAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return _buildEmptyState('Error al cargar historial médico');
        }

        final eventos = snapshot.data ?? [];

        if (eventos.isEmpty) {
          return _buildEmptyState('Sin historial médico');
        }

        // Ordenar por fecha descendente (más reciente primero)
        eventos.sort((a, b) => b.fecha.compareTo(a.fecha));

        return Column(
          children: eventos.map((evento) {
            // Determinar icono y color según el tipo
            IconData icon;
            Color color;
            String tipoNombre;

            switch (evento.tipo) {
              case TipoEvento.vacuna:
                icon = Icons.vaccines;
                color = Colors.blue;
                tipoNombre = 'Vacunación';
                break;
              case TipoEvento.desparasitante:
                icon = Icons.bug_report;
                color = Colors.green;
                tipoNombre = 'Desparasitación';
                break;
              case TipoEvento.tratamiento:
                icon = Icons.medication;
                color = Colors.orange;
                tipoNombre = 'Tratamiento';
                break;
              case TipoEvento.revisionVeterinaria:
                icon = Icons.health_and_safety;
                color = Colors.teal;
                tipoNombre = 'Diagnóstico';
                break;
              case TipoEvento.castracion:
                icon = Icons.healing;
                color = Colors.red;
                tipoNombre = 'Cirugía';
                break;
              default:
                icon = Icons.medical_services;
                color = Colors.grey;
                tipoNombre = evento.tipo.name;
            }
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: color.withAlpha(26),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            icon,
                            color: color,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tipoNombre,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                evento.nombreProducto ?? 'N/A',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                              if (evento.notas != null && evento.notas!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  evento.notas!,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade400),
                            const SizedBox(height: 2),
                            Text(
                              '${evento.fecha.day.toString().padLeft(2, '0')}/${evento.fecha.month.toString().padLeft(2, '0')}/${evento.fecha.year}',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildVaccinesList(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<EventoSanitario>>(
      future: isarService.obtenerEventosPorAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return _buildEmptyState('Error al cargar vacunas');
        }

        final eventos = snapshot.data ?? [];

        // Filtrar solo vacunas
        final vacunas = eventos.where((e) => e.tipo == TipoEvento.vacuna).toList();

        if (vacunas.isEmpty) {
          return _buildEmptyState('Sin vacunas registradas');
        }

        // Ordenar por fecha descendente
        vacunas.sort((a, b) => b.fecha.compareTo(a.fecha));

        return Column(
          children: vacunas.map((vacuna) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(26),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue.withAlpha(77),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(51),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.vaccines,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vacuna.nombreProducto ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Aplicada: ${vacuna.fecha.day.toString().padLeft(2, '0')}/${vacuna.fecha.month.toString().padLeft(2, '0')}/${vacuna.fecha.year}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 24,
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildOffspringHistory(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<RegistroProduccion>>(
      future: isarService.obtenerProduccionPorAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return _buildEmptyState('Error al cargar historial de partos');
        }

        final registros = snapshot.data ?? [];

        // Filtrar solo los partos
        final partos = registros.where((r) => r.tipo == 'Parto').toList();

        if (partos.isEmpty) {
          return _buildEmptyState('Sin crías registradas');
        }

        // Ordenar por fecha descendente
        partos.sort((a, b) => b.fecha.compareTo(a.fecha));

        return Column(
          children: partos.map((parto) {
            // Extraer el sexo de las notas si existe
            bool esMacho = false;
            if (parto.notas != null && parto.notas!.contains('Sexo:')) {
              esMacho = parto.notas!.contains('Macho');
            }
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: Colors.brown.shade50,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            esMacho ? Icons.male : Icons.female,
                            color: esMacho ? Colors.blue : Colors.pink,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                parto.idCria ?? 'Cría sin identificar',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Nacido: ${parto.fecha.day.toString().padLeft(2, '0')}/${parto.fecha.month.toString().padLeft(2, '0')}/${parto.fecha.year}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                              if (parto.pesoKg != null) ...[
                                const SizedBox(height: 2),
                                Text(
                                  'Peso al nacer: ${parto.pesoKg!.toStringAsFixed(1)} kg',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (parto.notas != null && parto.notas!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.brown.withAlpha(26),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.notes,
                              color: Colors.brown,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'activo':
        return Colors.green;
      case 'enfermo':
        return Colors.orange;
      case 'muerto':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
