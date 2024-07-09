import 'package:flutter/material.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/category_list_tile.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        Category category = categories[index];
        return CategoryListTile(category: category);
      },
    );
  }
}
