import 'package:flutter/material.dart';
import 'package:skar_admin/models/category.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Category>? childCategories = category.childCategories;

    return Card(
      child: (childCategories!.isNotEmpty)
          ? ListTile(
              title: Text(category.nameTM),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.adaptive.arrow_forward),
              ),
            )
          : CheckboxListTile.adaptive(
              value: false,
              onChanged: (value) {},
              title: Text(category.nameTM),
            ),
    );
  }
}
