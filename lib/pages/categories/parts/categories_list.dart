import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/category_list_tile.dart';
import 'package:skar_admin/providers/pages/category.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> selectedCategories = ref.read(selectedCategoriesProvider);

    return ListView.builder(
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        Category category = categories[index];

        for (var sc in selectedCategories) {
          if (sc.id == category.id) {
            category.isChecked = true;
          }
        }

        return CategoryListTile(category: category);
      },
    );
  }
}
