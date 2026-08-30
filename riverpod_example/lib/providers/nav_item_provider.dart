import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/nav_model.dart';
import 'package:riverpod_example/repositories/nav_repository.dart';

final navItemsProvider = AsyncNotifierProvider<NavItemNotifier, List<NavModel>>(
  () => NavItemNotifier(),
);

class NavItemNotifier extends AsyncNotifier<List<NavModel>> {
  late final NavRepository _repo;

  @override
  FutureOr<List<NavModel>> build() {
    _repo = ref.read(navRepositoryProvider);
    return _repo.fetchNavItems();
  }

  // Optional: helper to refresh manually
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.fetchNavItems());
  }
}
