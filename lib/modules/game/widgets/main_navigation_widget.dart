import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_theme.dart';

class MainNavigation extends StatelessWidget {
  final Widget child;
  const MainNavigation({super.key, required this.child});

  static final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.sports_esports, label: 'Jogo', route: '/'),
    _NavItem(
      icon: Icons.add_circle_outline,
      label: 'Nova',
      route: '/new-match',
    ),
    _NavItem(icon: Icons.history, label: 'Histórico', route: '/history'),
    _NavItem(icon: Icons.rule, label: 'Regras', route: '/stats'),
    _NavItem(icon: Icons.settings, label: 'Config', route: '/settings'),
  ];

  @override
  Widget build(BuildContext context) {
    final String location =
        GoRouter.of(context).routeInformationProvider.value.location;

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _getIndexFromLocation(location),
        onTap: (index) {
          final selected = _navItems[index].route;
          if (selected != location) {
            context.go(selected);
          }
        },
        items:
            _navItems
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.label,
                  ),
                )
                .toList(),
      ),
    );
  }

  int _getIndexFromLocation(String location) {
    return _navItems.indexWhere((item) => location == item.route);
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final String route;

  _NavItem({required this.icon, required this.label, required this.route});
}
