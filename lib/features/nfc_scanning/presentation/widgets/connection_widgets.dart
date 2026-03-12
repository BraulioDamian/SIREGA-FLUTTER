import 'package:flutter/material.dart';

class ScanningIndicatorWidget extends StatefulWidget {
  final String message;
  final String submessage;

  const ScanningIndicatorWidget({
    super.key,
    required this.message,
    required this.submessage,
  });

  @override
  State<ScanningIndicatorWidget> createState() =>
      _ScanningIndicatorWidgetState();
}

class _ScanningIndicatorWidgetState extends State<ScanningIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animación de carga
            SizedBox(
              width: 120,
              height: 120,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: RipplePainter(
                      progress: _animationController.value,
                      color: theme.colorScheme.primary,
                    ),
                    child: Icon(
                      Icons.wifi_tethering,
                      size: 50,
                      color: theme.colorScheme.primary,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Mensaje principal
            Text(
              widget.message,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Submensaje
            Text(
              widget.submessage,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Indicador de progreso
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: theme.colorScheme.primary.withAlpha(
                  (255 * 0.2).round(),
                ),
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final VoidCallback? onOpenWifiSettings;

  const ScanErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.onOpenWifiSettings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de error
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline,
                size: 60,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 24),

            // Título de error
            Text(
              'Error de Conexión',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Mensaje de error
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha((255 * 0.05).round()),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.red.withAlpha((255 * 0.2).round()),
                  width: 1,
                ),
              ),
              child: Text(
                errorMessage,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.red.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),

            // Botón de reintentar
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // Botón de configuración WiFi (si está disponible)
            if (onOpenWifiSettings != null) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: onOpenWifiSettings,
                  icon: const Icon(Icons.settings),
                  label: const Text('Configuración WiFi'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ConnectionStatusWidget extends StatelessWidget {
  final bool isConnected;
  final String deviceName;
  final VoidCallback onDisconnect;

  const ConnectionStatusWidget({
    super.key,
    required this.isConnected,
    required this.deviceName,
    required this.onDisconnect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isConnected
            ? Colors.green.withAlpha((255 * 0.1).round())
            : Colors.red.withAlpha((255 * 0.1).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isConnected
              ? Colors.green.withAlpha((255 * 0.3).round())
              : Colors.red.withAlpha((255 * 0.3).round()),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Indicador de estado
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isConnected ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),

          // Información del dispositivo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deviceName,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  isConnected ? 'Conectado' : 'Desconectado',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isConnected
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                ),
              ],
            ),
          ),

          // Botón de desconectar
          if (isConnected)
            IconButton(
              onPressed: onDisconnect,
              icon: const Icon(Icons.close),
              iconSize: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
        ],
      ),
    );
  }
}

// Painter personalizado para la animación de ondas
class RipplePainter extends CustomPainter {
  final double progress;
  final Color color;

  RipplePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    final paint = Paint()
      ..color = color.withAlpha((255 * (1 - progress) * 0.3).round())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Dibujar múltiples ondas
    for (int i = 0; i < 3; i++) {
      final radius = maxRadius * progress + (i * 20);
      if (radius <= maxRadius) {
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
