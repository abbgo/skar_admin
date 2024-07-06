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
      showWidget = Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          isTM ? selectedShop.nameTM : selectedShop.nameRU,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      showWidget = Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          isTM ? parentShop!.nameTM : parentShop!.nameRU,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return showWidget;

    // return selectedShop == SelectedShop.defaultSelectedShop() &&
    //         parentShop == null
    //     ? const SizedBox()
    //     : Padding(
    //         padding: const EdgeInsets.only(bottom: 10),
    //         child: Text(
    //           isTM ? selectedShop.nameTM : selectedShop.nameRU,
    //           style: const TextStyle(
    //             color: Colors.green,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       );
  }
}
