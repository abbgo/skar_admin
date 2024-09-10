import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_shop.dart';

class AtHomeInputButton extends ConsumerWidget {
  const AtHomeInputButton({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final bool value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool atHomeShop = ref.watch(atHomeShopProvider);

    return RadioMenuButton(
      value: value,
      groupValue: atHomeShop,
      onChanged: (value) {},
      child: Text(text),
    );
  }
}
