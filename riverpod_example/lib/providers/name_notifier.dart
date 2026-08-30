import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = NotifierProvider<NameNotifier, String>(NameNotifier.new);

class NameNotifier extends Notifier<String> {
  @override
  String build() {
    return 'Riverpod';
  }

  void updateName(String newName) {
    state = newName;
  }

  void resetName() {
    state = 'Riverpod';
  }
}
