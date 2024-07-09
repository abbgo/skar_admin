import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/providers/pages/category.dart';
import 'package:skar_admin/styles/colors.dart';

class CategoryCheckBoxListTile extends StatefulWidget {
  const CategoryCheckBoxListTile({super.key, required this.category});

  final Category category;

  @override
  State<CategoryCheckBoxListTile> createState() =>
      _CategoryCheckBoxListTileState();
}

class _CategoryCheckBoxListTileState extends State<CategoryCheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return CheckboxListTile.adaptive(
          activeColor: elevatedButtonColor,
          value: widget.category.isChecked,
          onChanged: (value) async {
            setState(() {
              widget.category.isChecked = value!;
            });

            if (value!) {
              await ref
                  .read(selectedCategoriesProvider.notifier)
                  .addCategory(widget.category);
              return;
            }

            await ref
                .read(selectedCategoriesProvider.notifier)
                .removeCategory(widget.category);
          },
          title: Text(widget.category.nameTM),
        );
      },
    );
  }
}
