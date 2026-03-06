// lib/presentation/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/auth_service.dart';
import 'package:sirega_app/nucleo/servicios/firebase_sync_service.dart';
import 'package:sirega_app/modulos/0_autenticacion/presentation/bloc/auth_bloc.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Future<void> _confirmLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      // Cerrar el diálogo y la pantalla de perfil
      Navigator.of(context).popUntil((route) => route.isFirst);

      // Hacer logout - el AuthWrapper se encargará de mostrar LoginScreen
      context.read<AuthBloc>().add(AuthLogoutRequested());
    }
  }

  Future<void> _confirmDeleteFirestoreData(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('⚠️ Eliminar Datos de Firestore'),
        content: const Text(
          '¿Estás seguro de que quieres ELIMINAR TODOS los datos de Firestore?\n\n'
          'Esta acción NO afectará los datos locales (Isar).\n\n'
          'Podrás re-sincronizar después.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Eliminar Todo'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await _deleteAllFirestoreData(context);
    }
  }

  Future<void> _deleteAllFirestoreData(BuildContext context) async {
    final syncService = RepositoryProvider.of<FirebaseSyncService>(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('Eliminando datos...'),
          ],
        ),
      ),
    );

    try {
      await syncService.deleteAllUserDataFromFirestore();

      if (context.mounted) {
        Navigator.pop(context); // Cerrar diálogo de progreso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Datos de Firestore eliminados'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context); // Cerrar diálogo de progreso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Error: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthService>(context);
    final user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Información del usuario
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Hero(
                    tag: 'profile_avatar',
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: user?.photoURL != null
                          ? ClipOval(
                              child: Image.network(
                                user!.photoURL!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person,
                                      size: 50, color: Colors.white);
                                },
                              ),
                            )
                          : const Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user?.displayName ?? 'Usuario',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user?.email ?? 'No email',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'UID: ${user?.uid ?? "N/A"}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textHint,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Sección de Datos
          Text(
            'Gestión de Datos',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // Botón para eliminar datos de Firestore
          Card(
            child: ListTile(
              leading: const Icon(Icons.cloud_off, color: AppColors.warning),
              title: const Text('Limpiar Datos de Firestore'),
              subtitle: const Text(
                'Elimina todos tus datos de la nube (los datos locales se mantienen)',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _confirmDeleteFirestoreData(context),
            ),
          ),

          const SizedBox(height: 24),

          // Sección de Cuenta
          Text(
            'Cuenta',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // Botón de cerrar sesión
          Card(
            color: AppColors.error.withValues(alpha: 0.05),
            child: ListTile(
              leading: const Icon(Icons.logout, color: AppColors.error),
              title: const Text(
                'Cerrar Sesión',
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.error),
              onTap: () => _confirmLogout(context),
            ),
          ),

          const SizedBox(height: 24),

          // Información adicional
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.info.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.info.withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppColors.info),
                    const SizedBox(width: 8),
                    const Text(
                      'Información',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.info,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '• Limpiar Firestore: Elimina todos tus datos de la nube pero mantiene los datos locales',
                ),
                const SizedBox(height: 4),
                const Text(
                  '• Después de limpiar, puedes re-sincronizar desde la pantalla de Debug',
                ),
                const SizedBox(height: 4),
                const Text(
                  '• Cerrar sesión: Sales de la app pero los datos se mantienen',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
