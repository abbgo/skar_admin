import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/shopping_center.dart';

class ShowParentShop extends ConsumerWidget {
  const ShowParentShop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Shop selectedShop = ref.watch(selectedShoppincCenterProvider);
    bool isTM = ref.watch(langProvider) == 'tr';

    return selectedShop == Shop.defaultShop()
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              isTM ? selectedShop.nameTM : selectedShop.nameRU,
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
          );
  }
}
