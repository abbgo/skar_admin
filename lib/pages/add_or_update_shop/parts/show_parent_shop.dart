import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/shopping_center.dart';

class ShowParentShop extends ConsumerWidget {
  const ShowParentShop({super.key, this.parentShop});

  final Shop? parentShop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget showWidget;

    SelectedShop selectedShop = ref.watch(selectedShoppincCenterProvider);
    bool isTM = ref.watch(langProvider) == 'tr';

    if (selectedShop == SelectedShop.defaultSelectedShop() &&
        parentShop == null) {
      showWidget = const SizedBox();
    } else if (selectedShop != SelectedShop.defaultSelectedShop()) {
      showWidget = showParentShopMethod(isTM, selectedShop, null);
    } else {
      showWidget = showParentShopMethod(isTM, null, parentShop);
    }

    return showWidget;
  }

  Padding showParentShopMethod(
    bool isTM,
    SelectedShop? selectedShop,
    Shop? parentShop,
  ) {
    String text;
    if (selectedShop != null) {
      if (isTM) {
        text = selectedShop.nameTM;
      } else {
        text = selectedShop.nameRU;
      }
    } else {
      if (isTM) {
        text = parentShop!.nameTM;
      } else {
        text = parentShop!.nameRU;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }
}
