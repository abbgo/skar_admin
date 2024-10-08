import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';

class SelectedCategoriesNotifier extends StateNotifier<List<Category>> {
  SelectedCategoriesNotifier() : super([]);

  Future<void> addCategory(Category category) async {
    if (!state.contains(category)) {
      state = [...state, category];
    }
  }

  Future<void> removeCategory(Category category) async {
    state = state.where((i) => i != category).toList();
  }

  Future<void> setCategories(List<Category> categories) async {
    state = categories;
  }

  Future<void> removeAllCategories() async {
    state = [];
  }
}
