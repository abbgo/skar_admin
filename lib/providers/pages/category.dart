import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/notifiers/pages/category.dart';

var categorySearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasCategoriesProvider = StateProvider.autoDispose<bool>((ref) => true);

var selectedCategoriesProvider =
    StateNotifierProvider<SelectedCategoriesNotifier, List<Category>>(
  (ref) => SelectedCategoriesNotifier(),
);
