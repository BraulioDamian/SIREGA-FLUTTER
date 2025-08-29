import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:intl/intl.dart';

/// Widget mejorado para mostrar los datos del animal escaneado
/// Presenta la información de forma visual y organizada
class AnimalInfoCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback? onVerMas;
  final VoidCallback? onEditarDatos;
  
  const AnimalInfoCard({
    Key? key,
    required this.animal,
    this.onVerMas,
    this.onEditarDatos,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header con imagen y datos principales
          _buildHeader(context),
          
          // Indicadores de estado
          _buildStatusIndicators(context),
          
          // Información detallada en tabs
          _buildDetailedInfo(context),
          
          // Botones de acción
          if (onVerMas != null || onEditarDatos != null)
            _buildActionButtons(context),
        ],
      ),
    );
  }
  
  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withOpacity(0.7),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Foto del animal
            Hero(
              tag: 'animal_${animal.id}',
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  image: DecorationImage(
                    image: animal.fotoPerfilUrl != null
                        ? NetworkImage(animal.fotoPerfilUrl!)
                        : const AssetImage('assets/images/default_cow.png') as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Información principal
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.nombre,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildInfoChip(
                    Icons.tag,
                    animal.idAreteVisual ?? 'Sin arete',
                    Colors.white.withOpacity(0.9),
                  ),
                  const SizedBox(height: 4),
                  _buildInfoChip(
                    Icons.cake,
                    animal.getEdadFormateada(),
                    Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
            ),
            
            // Icono de sexo
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                animal.sexo == Sexo.macho ? Icons.male : Icons.female,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatusIndicators(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatusBadge(
            context,
            'Estado',
            animal.estado.name.toUpperCase(),
            _getEstadoColor(animal.estado),
            Icons.pets,
          ),
          _buildStatusBadge(
            context,
            'Salud',
            animal.estadoSalud.name.toUpperCase(),
            _getEstadoSaludColor(animal.estadoSalud),
            Icons.favorite,
          ),
          if (animal.gestante)
            _buildStatusBadge(
              context,
              'Gestación',
              '${animal.diasGestacion ?? 0} días',
              Colors.purple,
              Icons.child_care,
            ),
        ],
      ),
    );
  }
  
  Widget _buildDetailedInfo(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(25),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(icon: Icon(Icons.info), text: 'General'),
                Tab(icon: Icon(Icons.favorite), text: 'Salud'),
                Tab(icon: Icon(Icons.child_friendly), text: 'Reproducción'),
                Tab(icon: Icon(Icons.show_chart), text: 'Producción'),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: TabBarView(
              children: [
                _buildGeneralTab(context),
                _buildSaludTab(context),
                _buildReproduccionTab(context),
                _buildProduccionTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildGeneralTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDetailRow('Raza', animal.raza),
          _buildDetailRow('Fecha de Nacimiento', 
            DateFormat('dd/MM/yyyy').format(animal.fechaNacimiento)),
          _buildDetailRow('Peso al Nacer', 
            animal.pesoNacimiento != null ? '${animal.pesoNacimiento} kg' : 'No registrado'),
          _buildDetailRow('Peso Actual', 
            animal.pesoActual != null ? '${animal.pesoActual} kg' : 'No registrado'),
          _buildDetailRow('Color de Pelaje', animal.colorPelaje ?? 'No registrado'),
          _buildDetailRow('Ubicación', animal.zonaActual ?? 'No registrada'),
        ],
      ),
    );
  }
  
  Widget _buildSaludTab(BuildContext context) {
    final necesitaVacunacion = animal.necesitaVacunacion();
    final necesitaDesparasitacion = animal.necesitaDesparasitacion();
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (necesitaVacunacion || necesitaDesparasitacion)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _getAlertasText(necesitaVacunacion, necesitaDesparasitacion),
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          _buildDetailRow('Última Revisión', 
            animal.fechaUltimaRevision != null 
              ? DateFormat('dd/MM/yyyy').format(animal.fechaUltimaRevision!)
              : 'No registrada'),
          _buildDetailRow('Veterinario', 
            animal.veterinarioUltimaRevision ?? 'No registrado'),
          _buildDetailRow('Temperatura', 
            animal.temperaturaActual != null ? '${animal.temperaturaActual}°C' : 'No registrada'),
          _buildDetailRow('Frecuencia Cardíaca', 
            animal.frecuenciaCardiaca != null ? '${animal.frecuenciaCardiaca} bpm' : 'No registrada'),
        ],
      ),
    );
  }
  
  Widget _buildReproduccionTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (animal.sexo == Sexo.hembra) ...[
            _buildDetailRow('Estado Reproductivo', 
              animal.estadoReproductivo?.name ?? 'No registrado'),
            _buildDetailRow('Gestante', animal.gestante ? 'Sí' : 'No'),
            if (animal.gestante) ...[
              _buildDetailRow('Días de Gestación', '${animal.diasGestacion ?? 0}'),
              _buildDetailRow('Fecha Próximo Parto', 
                animal.fechaProximoParto != null 
                  ? DateFormat('dd/MM/yyyy').format(animal.fechaProximoParto!)
                  : 'No registrada'),
            ],
            _buildDetailRow('Número de Partos', '${animal.numeroPartos}'),
            _buildDetailRow('Número de Crías', '${animal.numeroCrias}'),
          ] else
            const Center(
              child: Text(
                'Información reproductiva no aplica para machos',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
        ],
      ),
    );
  }
  
  Widget _buildProduccionTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (animal.sexo == Sexo.hembra && animal.promedioLecheDiario != null) ...[
            _buildDetailRow('Promedio Diario de Leche', 
              '${animal.promedioLecheDiario} L'),
            _buildDetailRow('Producción Total', 
              '${animal.produccionLecheTotal ?? 0} L'),
          ],
          _buildDetailRow('Ganancia Promedio Diaria', 
            animal.gananciaPromedioDiaria != null 
              ? '${animal.gananciaPromedioDiaria} kg/día'
              : 'No registrada'),
          _buildDetailRow('Valor Estimado', 
            animal.valorEstimado != null 
              ? '\$${NumberFormat('#,###').format(animal.valorEstimado)}'
              : 'No registrado'),
        ],
      ),
    );
  }
  
  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (onEditarDatos != null)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onEditarDatos,
                icon: const Icon(Icons.edit),
                label: const Text('Editar'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          if (onEditarDatos != null && onVerMas != null) 
            const SizedBox(width: 12),
          if (onVerMas != null)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onVerMas,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ver Más'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
  
  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 14),
        ),
      ],
    );
  }
  
  Widget _buildStatusBadge(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Color _getEstadoColor(EstadoAnimal estado) {
    switch (estado) {
      case EstadoAnimal.activo:
        return Colors.green;
      case EstadoAnimal.vendido:
        return Colors.blue;
      case EstadoAnimal.muerto:
        return Colors.red;
      case EstadoAnimal.perdido:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
  
  Color _getEstadoSaludColor(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Colors.green;
      case EstadoSalud.enfermo:
        return Colors.red;
      case EstadoSalud.enTratamiento:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
  
  String _getAlertasText(bool vacunacion, bool desparasitacion) {
    if (vacunacion && desparasitacion) {
      return 'Necesita vacunación y desparasitación';
    } else if (vacunacion) {
      return 'Necesita vacunación';
    } else {
      return 'Necesita desparasitación';
    }
  }
}
