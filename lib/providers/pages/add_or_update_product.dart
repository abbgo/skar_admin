import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadCreateProductProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final visibleProductProvider = StateProvider<bool>((ref) => true);
