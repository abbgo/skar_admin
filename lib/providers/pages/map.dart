import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationPermissionProvider =
    StateProvider.autoDispose<bool>((ref) => false);
