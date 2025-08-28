import 'package:flutter/material.dart';

class ResponsiveSaveButton extends StatelessWidget {
  final bool canSave;
  final VoidCallback? onPressed;
  final bool isLoading;

  const ResponsiveSaveButton({
    super.key,
    required this.canSave,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 0 : 16,
            vertical: 8,
          ),
          child: ElevatedButton.icon(
            onPressed: canSave && !isLoading ? onPressed : null,
            icon: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save, size: 24),
            label: Text(
              isLoading ? 'Guardando...' : 'Registrar Animal',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: canSave && !isLoading ? Colors.green : Colors.grey,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 18,
                horizontal: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: canSave ? 3 : 1,
            ),
          ),
        );
      },
    );
  }
}

class ValidationSummary extends StatelessWidget {
  final bool sinigaValid;
  final bool nfcValid;
  final List<String> missingRequirements;

  const ValidationSummary({
    super.key,
    required this.sinigaValid,
    required this.nfcValid,
    this.missingRequirements = const [],
  });

  @override
  Widget build(BuildContext context) {
    final allValid = sinigaValid && nfcValid;
    
    if (allValid) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green.shade700),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Todo listo para registrar el animal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.orange.shade700),
              const SizedBox(width: 8),
              const Text(
                'Completar campos requeridos:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...[
            if (!sinigaValid) '• ID SINIGA válido',
            if (!nfcValid) '• Lectura de chip NFC',
            ...missingRequirements.map((req) => '• $req'),
          ].map((requirement) => Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(
                  requirement,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange.shade800,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
