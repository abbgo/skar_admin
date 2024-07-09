import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';

class SelectedCategoriesNotifier extends StateNotifier<List<Category>> {
  SelectedCategoriesNotifier() : super([]);

  void addCategory(Category category) {
    if (!state.contains(category)) {
      state = [...state, category];
    }
  }

  void removeCategory(Category category) {
    if (state.contains(category)) {
      state.remove(category);
    }
  }
}

var selectedCategoriesProvider =
    StateNotifierProvider.autoDispose<SelectedCategoriesNotifier, List<String>>(
  (ref) => SelectedCategoriesNotifier(),
);
