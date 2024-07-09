import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/categories.dart';

class CategoryBasicListTile extends StatelessWidget {
  const CategoryBasicListTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.nameTM),
      trailing: IconButton(
        onPressed: () => goToPage(
          context,
          CategoriesPage(childCategories: category.childCategories!),
          false,
        ),
        icon: Icon(Icons.adaptive.arrow_forward),
      ),
    );
  }
}
