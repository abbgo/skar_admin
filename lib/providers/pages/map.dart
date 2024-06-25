import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationPermissionProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final loadProvider = StateProvider.autoDispose<bool>((ref) => true);
