import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoriesProvider =
    StateProvider.autoDispose<List<String>>((ref) => []);
