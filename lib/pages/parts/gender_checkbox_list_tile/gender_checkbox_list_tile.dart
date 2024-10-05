import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/styles/colors.dart';

class GenderCheckboxListTile extends StatefulWidget {
  const GenderCheckboxListTile(
      {super.key, required this.title, required this.value});

  final String title;
  final dynamic value;

  @override
  State<GenderCheckboxListTile> createState() => _GenderCheckboxListTileState();
}

class _GenderCheckboxListTileState extends State<GenderCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<dynamic> productGenders = ref.watch(productGendersProvider);

        return CheckboxListTile.adaptive(
          title: Text(widget.title),
          activeColor: elevatedButtonColor,
          value: productGenders.contains(widget.value),
          onChanged: (value) {},
        );
      },
    );
  }
}
