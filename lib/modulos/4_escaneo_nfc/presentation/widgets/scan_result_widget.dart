import 'package:flutter/material.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/animal_info_card.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

/// Widget unificado para mostrar el resultado del escaneo NFC
/// Puede ser usado tanto para el escáner móvil como para el escáner externo ESP32
class ScanResultWidget extends StatelessWidget {
  final Animal animal;
  final VoidCallback onScanAnother;
  final VoidCallback? onViewDetails;
  final VoidCallback? onEditData;
  final String successMessage;
  
  const ScanResultWidget({
    Key? key,
    required this.animal,
    required this.onScanAnother,
    this.onViewDetails,
    this.onEditData,
    this.successMessage = 'Animal encontrado',
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Banner de éxito
          _buildSuccessBanner(theme),
          const SizedBox(height: 16),
          
          // Tarjeta con información del animal
          AnimalInfoCard(
            animal: animal,
            onVerMas: onViewDetails,
            onEditarDatos: onEditData,
          ),
          const SizedBox(height: 20),
          
          // Botón para escanear otro
          _buildScanAnotherButton(context),
        ],
      ),
    );
  }
  
  Widget _buildSuccessBanner(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  successMessage,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  animal.nombre,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildScanAnotherButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onScanAnother,
        icon: const Icon(Icons.refresh),
        label: const Text('Escanear Otro Animal'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

/// Widget para mostrar errores de escaneo de forma consistente
class ScanErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final IconData icon;
  final Color? color;
  
  const ScanErrorWidget({
    Key? key,
    required this.errorMessage,
    required this.onRetry,
    this.icon = Icons.error_outline,
    this.color,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorColor = color ?? theme.colorScheme.error;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: errorColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 60,
                color: errorColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Error',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: errorColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget para mostrar estado de conexión
class ConnectionStatusWidget extends StatelessWidget {
  final bool isConnected;
  final String deviceName;
  final VoidCallback? onDisconnect;
  
  const ConnectionStatusWidget({
    Key? key,
    required this.isConnected,
    this.deviceName = 'Dispositivo',
    this.onDisconnect,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isConnected 
                  ? Colors.green.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isConnected ? Icons.bluetooth_connected : Icons.bluetooth_disabled,
                color: isConnected ? Colors.green : Colors.grey,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    deviceName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    isConnected ? 'Conectado' : 'Desconectado',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isConnected ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (isConnected && onDisconnect != null)
              IconButton(
                onPressed: onDisconnect,
                icon: const Icon(Icons.close, size: 20),
                tooltip: 'Desconectar',
              ),
          ],
        ),
      ),
    );
  }
}

/// Widget para mostrar estado de escaneo
class ScanningIndicatorWidget extends StatelessWidget {
  final String message;
  final String? submessage;
  
  const ScanningIndicatorWidget({
    Key? key,
    required this.message,
    this.submessage,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                ),
              ),
              Icon(
                Icons.nfc,
                size: 60,
                color: theme.colorScheme.primary.withOpacity(0.5),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          if (submessage != null) ...[
            const SizedBox(height: 8),
            Text(
              submessage!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
