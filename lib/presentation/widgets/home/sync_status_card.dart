
// lib/presentation/widgets/home/sync_status_card.dart
import 'package:flutter/material.dart';

class SyncStatusCard extends StatelessWidget {
  final bool sincronizando;
  final int registrosPendientesSync;
  final DateTime? ultimaSync;
  final AnimationController syncAnimationController;
  final VoidCallback onSyncPressed;
  final String Function(DateTime) formatearTiempo;


  const SyncStatusCard({
    super.key,
    required this.sincronizando,
    required this.registrosPendientesSync,
    required this.ultimaSync,
    required this.syncAnimationController,
    required this.onSyncPressed,
    required this.formatearTiempo,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: sincronizando ? Colors.blue[50] : Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: sincronizando ? Colors.blue[200]! : Colors.green[200]!,
        ),
      ),
      child: Row(
        children: [
          if (sincronizando)
            RotationTransition(
              turns: syncAnimationController,
              child: const Icon(Icons.sync, color: Colors.blue),
            )
          else
            Icon(
              registrosPendientesSync > 0
                  ? Icons.sync_problem
                  : Icons.check_circle,
              color:
                  registrosPendientesSync > 0 ? Colors.orange : Colors.green,
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sincronizando
                      ? 'Sincronizando...'
                      : registrosPendientesSync > 0
                          ? '$registrosPendientesSync registros pendientes'
                          : 'Todo sincronizado',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (ultimaSync != null)
                  Text(
                    'Última sync: ${formatearTiempo(ultimaSync!)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: sincronizando ? null : onSyncPressed,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Sincronizar'),
          ),
        ],
      ),
    );
  }
}
