import 'package:flutter/material.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/basic_list_tile.dart';
import 'package:skar_admin/pages/categories/parts/category_check_box_list_tile.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Category>? childCategories = category.childCategories;

    return Card(
      child: (childCategories!.isNotEmpty)
          ? CategoryBasicListTile(category: category)
          : CategoryCheckBoxListTile(category: category),
    );
  }
}
