import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCategoriesNotifier extends StateNotifier<List<String>> {
  SelectedCategoriesNotifier() : super([]);

  void addCategory(String categoryID) {
    if (!state.contains(categoryID)) {
      state = [...state, categoryID];
    }
  }

  void removeCategory(String categoryID) {
    if (state.contains(categoryID)) {
      state.remove(categoryID);
    }
  }
}

var selectedCategoriesProvider =
    StateNotifierProvider.autoDispose<SelectedCategoriesNotifier, List<String>>(
  (ref) => SelectedCategoriesNotifier(),
);
