import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/add_or_update_shop.dart';
import 'package:skar_admin/styles/colors.dart';

class AtHomeInputButton extends ConsumerWidget {
  const AtHomeInputButton({
    super.key,
    required this.text,
    required this.buttonValue,
  });

  final String text;
  final bool buttonValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool atHomeShop = ref.watch(atHomeShopProvider);

    return GestureDetector(
      onTap: () => ref.read(atHomeShopProvider.notifier).state = buttonValue,
      child: Row(
        children: [
          Radio(
            value: buttonValue,
            groupValue: atHomeShop,
            onChanged: (value) =>
                ref.read(atHomeShopProvider.notifier).state = buttonValue,
            activeColor: elevatedButtonColor,
          ),
          Text(text),
        ],
      ),
    );
  }
}
