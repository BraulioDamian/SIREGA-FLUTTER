// lib/presentation/widgets/home/home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  final bool isSearching;
  final TextEditingController searchController;
  final int alertasSanitarias;
  final VoidCallback onToggleSearch;
  final ValueChanged<String> onSearchSubmitted;
  final VoidCallback onShowNotifications;
  final ValueChanged<String> onMenuOptionSelected;

  const HomeAppBar({
    super.key,
    required this.isSearching,
    required this.searchController,
    required this.alertasSanitarias,
    required this.onToggleSearch,
    required this.onSearchSubmitted,
    required this.onShowNotifications,
    required this.onMenuOptionSelected,
  });

  Widget _buildSearchField() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: searchController,
        autofocus: true,
        style: const TextStyle(color: AppColors.surface),
        decoration: InputDecoration(
          hintText: 'Buscar por name, arete o ID...',
          hintStyle: TextStyle(color: AppColors.surface.withValues(alpha: 0.7)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.surface),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: AppColors.surface.withValues(alpha: 0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.surface),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.surface.withValues(alpha: 0.7),
          ),
        ),
        onSubmitted: onSearchSubmitted,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: theme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: isSearching
            ? _buildSearchField()
            : const Text(
                'SIREGA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.primaryColor,
                theme.primaryColor.withValues(alpha: 0.7),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Patrón de fondo
              Positioned(
                right: -50,
                top: -50,
                child: Icon(
                  Icons.pets,
                  size: 250,
                  color: AppColors.surface.withValues(alpha: 0.1),
                ),
              ),
              // Información del header
              Positioned(
                left: 20,
                bottom: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rancho Los Alamos',
                      style: TextStyle(
                        color: AppColors.surface.withValues(alpha: 0.9),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Oaxaca, México',
                      style: TextStyle(
                        color: AppColors.surface.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (!isSearching)
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.surface),
            onPressed: onToggleSearch,
          ),
        if (isSearching)
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.surface),
            onPressed: onToggleSearch,
          ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: AppColors.surface,
              ),
              onPressed: onShowNotifications,
            ),
            if (alertasSanitarias > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$alertasSanitarias',
                    style: const TextStyle(
                      color: AppColors.surface,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: AppColors.surface),
          onSelected: onMenuOptionSelected,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'perfil',
              child: Row(
                children: [
                  Icon(Icons.person, size: 20),
                  SizedBox(width: 12),
                  Text('Mi Perfil'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'configuracion',
              child: Row(
                children: [
                  Icon(Icons.settings, size: 20),
                  SizedBox(width: 12),
                  Text('Configuración'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'ayuda',
              child: Row(
                children: [
                  Icon(Icons.help_outline, size: 20),
                  SizedBox(width: 12),
                  Text('Ayuda'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'salir',
              child: Row(
                children: [
                  Icon(Icons.logout, size: 20, color: AppColors.error),
                  SizedBox(width: 12),
                  Text(
                    'Cerrar Sesión',
                    style: TextStyle(color: AppColors.error),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
