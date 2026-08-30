import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/nav_model.dart';

abstract class NavRepository {
  Future<List<NavModel>> fetchNavItems();
}

class NavRepositoryImpl implements NavRepository {
  @override
  Future<List<NavModel>> fetchNavItems() async {
    // Simulate a delay to mimic fetching data from an API or database
    await Future.delayed(Duration(seconds: 4));

    // Return a list of NavModel items
    return [
      NavModel(id: 'home', title: 'Home', icon: 'home'),
      NavModel(id: 'profile', title: 'Profile', icon: 'profile'),
      NavModel(id: 'settings', title: 'Settings', icon: 'settings'),
      NavModel(
        id: 'unknown',
        title: 'Unknown',
        icon: 'unknown',
      ), // Example of an unknown item
    ];
  }
}

final navRepositoryProvider = Provider<NavRepository>((ref) {
  return NavRepositoryImpl();
});
