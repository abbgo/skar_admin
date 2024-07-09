import 'package:flutter/material.dart';
import 'package:skar_admin/models/category.dart';

class CategoryCheckBoxListTile extends StatelessWidget {
  const CategoryCheckBoxListTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: false,
      onChanged: (value) {},
      title: Text(category.nameTM),
    );
  }
}
