import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/notifiers/pages/login.dart';

var passwordVisibleProvider =
    StateNotifierProvider.autoDispose<PasswordVisibleNotifier, bool>(
  (ref) => PasswordVisibleNotifier(),
);

var buttonPressProvider = StateProvider.autoDispose<bool>((ref) => false);
