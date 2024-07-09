import 'package:flutter/material.dart';
import 'package:skar_admin/models/category.dart';

class BasicListTile extends StatelessWidget {
  const BasicListTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.nameTM),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.adaptive.arrow_forward),
      ),
    );
  }
}
