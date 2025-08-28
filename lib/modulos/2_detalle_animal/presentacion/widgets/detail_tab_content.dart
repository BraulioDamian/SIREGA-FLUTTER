import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/widgets/health_status_widget.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/widgets/production_charts.dart';

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
          title: 'Próximas Vacunas',
          icon: Icons.vaccines,
          color: Colors.orange,
          delay: 200,
          child: _buildUpcomingVaccines(context),
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
              const ProductionChart(type: ChartType.milk),
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
              const ProductionChart(type: ChartType.weight),
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
    final history = [
      {
        'date': '15/08/2024',
        'type': 'Vacunación',
        'description': 'Vacuna contra fiebre aftosa',
        'icon': Icons.vaccines,
        'color': Colors.blue,
      },
      {
        'date': '01/07/2024',
        'type': 'Desparasitación',
        'description': 'Tratamiento antiparasitario',
        'icon': Icons.bug_report,
        'color': Colors.green,
      },
    ];
    
    if (history.isEmpty) {
      return _buildEmptyState('Sin historial médico');
    }
    
    return Column(
      children: history.map((event) {
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
                        color: (event['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        event['icon'] as IconData,
                        color: event['color'] as Color,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['type'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            event['description'] as String,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade400),
                        const SizedBox(height: 2),
                        Text(
                          event['date'] as String,
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
  }

  Widget _buildUpcomingVaccines(BuildContext context) {
    final vaccines = [
      {'name': 'Brucelosis', 'date': '01/09/2024', 'daysLeft': 7},
      {'name': 'Carbunco', 'date': '15/09/2024', 'daysLeft': 21},
    ];
    
    if (vaccines.isEmpty) {
      return _buildEmptyState('No hay vacunas programadas');
    }
    
    return Column(
      children: vaccines.map((vaccine) {
        final daysLeft = vaccine['daysLeft'] as int;
        final urgency = daysLeft <= 7
            ? Colors.red
            : daysLeft <= 14
                ? Colors.orange
                : Colors.green;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                urgency.withOpacity(0.1),
                urgency.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: urgency.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: urgency.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.vaccines,
                  color: urgency,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vaccine['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      vaccine['date'] as String,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: urgency,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$daysLeft días',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOffspringHistory(BuildContext context) {
    final offspring = [
      {
        'name': 'Ternero #234',
        'birthDate': '15/03/2024',
        'sex': 'Macho',
        'status': 'Activo',
      },
      {
        'name': 'Ternera #235',
        'birthDate': '20/01/2023',
        'sex': 'Hembra',
        'status': 'Activo',
      },
    ];
    
    if (offspring.isEmpty) {
      return _buildEmptyState('Sin crías registradas');
    }
    
    return Column(
      children: offspring.map((cria) {
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
                        cria['sex'] == 'Macho' ? Icons.male : Icons.female,
                        color: cria['sex'] == 'Macho' ? Colors.blue : Colors.pink,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cria['name'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Nacido: ${cria['birthDate']}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        cria['status'] as String,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
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
