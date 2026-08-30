import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_example/providers/nav_item_provider.dart';
import 'package:riverpod_example/providers/nav_index_provider.dart';
import 'package:riverpod_example/screens/home.dart';
import 'package:riverpod_example/screens/profile.dart';
import 'package:riverpod_example/screens/setting.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);
    final navIndexNotifier = ref.read(navIndexProvider.notifier);
    final navItemsAsyncValue = ref.watch(navItemsProvider);

    IconData getIcon(String? icon) {
      switch (icon) {
        case 'home':
          return Icons.home_rounded;

        case 'profile':
          return Icons.person_rounded;

        case 'settings':
          return Icons.settings_rounded;

        default:
          return Icons.help_outline_rounded;
      }
    }

    return navItemsAsyncValue.when(
      // ------------------------------------------------------------
      // LOADING
      // ------------------------------------------------------------
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },

      // ------------------------------------------------------------
      // ERROR
      // ------------------------------------------------------------
      error: (error, stack) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Something went wrong',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '$error',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },

      // ------------------------------------------------------------
      // DATA
      // ------------------------------------------------------------
      data: (navItems) {
        final screens = navItems.map((item) {
          switch (item.id) {
            case 'home':
              return const HomeScreen();

            case 'profile':
              return const ProfileScreen();

            case 'settings':
              return const SettingsScreen();

            default:
              return const Center(child: Text('Unknown Screen'));
          }
        }).toList();

        final bottomItems = navItems.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(getIcon(item.icon)),
            activeIcon: Icon(getIcon(item.icon)),
            label: item.title ?? '',
          );
        }).toList();

        // Prevent invalid index
        final safeIndex = currentIndex >= 0 && currentIndex < screens.length
            ? currentIndex
            : 0;

        return Scaffold(
          // ----------------------------------------------------------
          // BODY
          // ----------------------------------------------------------
          body: IndexedStack(index: safeIndex, children: screens),

          // ----------------------------------------------------------
          // BOTTOM NAVIGATION
          // ----------------------------------------------------------
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BottomNavigationBar(
                  currentIndex: safeIndex,

                  onTap: (index) {
                    navIndexNotifier.setIndex(index);
                  },

                  items: bottomItems,

                  // Material 3 style
                  type: BottomNavigationBarType.fixed,

                  backgroundColor: Colors.transparent,

                  elevation: 0,

                  selectedItemColor: Theme.of(context).colorScheme.primary,

                  unselectedItemColor: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant,

                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),

                  unselectedLabelStyle: const TextStyle(fontSize: 12),

                  showUnselectedLabels: true,

                  iconSize: 26,

                  selectedIconTheme: const IconThemeData(size: 28),

                  unselectedIconTheme: const IconThemeData(size: 24),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
