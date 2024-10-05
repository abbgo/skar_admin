import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/styles/colors.dart';

class GenderCheckboxListTile extends ConsumerWidget {
  const GenderCheckboxListTile(
      {super.key, required this.title, required this.gender});

  final String title;
  final dynamic gender;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> productGenders = ref.watch(productGendersProvider);

    return CheckboxListTile.adaptive(
      contentPadding: const EdgeInsets.only(right: 140),
      title: Text(title),
      activeColor: elevatedButtonColor,
      value: productGenders.contains(gender),
      onChanged: (value) async {
        if (value!) {
          await ref.read(productGendersProvider.notifier).addGender(gender);
          return;
        }

        await ref.read(productGendersProvider.notifier).removeGender(gender);
      },
    );
  }
}
