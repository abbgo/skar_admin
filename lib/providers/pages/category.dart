import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/notifiers/pages/category.dart';

var selectedCategoriesProvider =
    StateNotifierProvider<SelectedCategoriesNotifier, List<Category>>(
  (ref) => SelectedCategoriesNotifier(),
);
