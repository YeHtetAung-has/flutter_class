// lib/providers/nav_index_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavIndexProvider extends Notifier<int> {
  @override
  int build() {
    return 0; // Default index
  }

  void setIndex(int newIndex) {
    state = newIndex;
  }
}

final navIndexProvider = NotifierProvider<NavIndexProvider, int>(
  NavIndexProvider.new,
);
