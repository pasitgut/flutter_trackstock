import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location =
        GoRouter.of(context).routeInformationProvider.value.uri.path;
    final int selectedIndex = () {
      if (location.startsWith('/history')) return 1;
      if (location.startsWith('/categories')) return 2;
      if (location.startsWith('/settings')) return 3;
      return 0;
    }();
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/items');
              break;
            case 1:
              context.go('/history');
              break;
            case 2:
              context.go('/categories');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}
