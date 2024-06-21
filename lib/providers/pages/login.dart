import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordVisibleNotifier extends StateNotifier<bool> {
  PasswordVisibleNotifier() : super(false);

  void changeVisibility() {
    state = !state;
  }
}

var passwordVisibleProvider =
    StateNotifierProvider.autoDispose<PasswordVisibleNotifier, bool>(
  (ref) => PasswordVisibleNotifier(),
);
