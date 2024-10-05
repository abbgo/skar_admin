import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/styles/colors.dart';

class GenderCheckboxListTile extends ConsumerWidget {
  const GenderCheckboxListTile(
      {super.key, required this.title, required this.value});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> productGenders = ref.watch(productGendersProvider);

    return CheckboxListTile.adaptive(
      contentPadding: const EdgeInsets.all(0),
      title: Text(title),
      activeColor: elevatedButtonColor,
      value: productGenders.contains(value),
      onChanged: (value) async {
        if (value!) {
          await ref.read(productGendersProvider.notifier).addGender(value);
          return;
        }

        await ref.read(productGendersProvider.notifier).removeGender(value);
      },
    );
  }
}
