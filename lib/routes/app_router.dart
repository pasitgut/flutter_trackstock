import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trackstock/features/categories/categories_screen.dart';
import 'package:flutter_trackstock/features/history/history_screen.dart';
import 'package:flutter_trackstock/features/home/home_screen.dart';
import 'package:flutter_trackstock/features/items/item_screen.dart';
import 'package:flutter_trackstock/features/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/items',
    routes: [
      ShellRoute(
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: '/items',
            name: 'items',
            pageBuilder:
                (context, state) => _buildTransitionPage(
                  key: state.pageKey,
                  child: const ItemScreen(),
                ),
          ),
          GoRoute(
            path: '/history',
            name: 'history',
            pageBuilder:
                (context, state) => _buildTransitionPage(
                  key: state.pageKey,
                  child: const HistoryScreen(),
                ),
          ),
          GoRoute(
            path: '/categories',
            name: 'categories',
            pageBuilder:
                (context, state) => _buildTransitionPage(
                  key: state.pageKey,
                  child: const CategoriesScreen(),
                ),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder:
                (context, state) => _buildTransitionPage(
                  key: state.pageKey,
                  child: const SettingsScreen(),
                ),
          ),
        ],
      ),
    ],
  );
});

CustomTransitionPage _buildTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
