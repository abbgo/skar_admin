import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/products/products.dart';
import 'package:skar_admin/styles/colors.dart';

class PopUpMenus extends StatelessWidget {
  const PopUpMenus({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    List<String> texts = [lang.change, lang.viewProducts, lang.moveToTrash];

    return PopupMenuButton(
      elevation: 3,
      color: Colors.white,
      itemBuilder: (context) => [
        popUpMenuMethod(texts[0], Icons.edit, elevatedButtonColor),
        popUpMenuMethod(texts[1], Icons.local_mall, Colors.green),
        popUpMenuMethod(texts[2], Icons.delete, Colors.red),
      ],
      onSelected: (value) {
        if (value == texts[0]) {
          goToPage(
            context,
            AddOrUpdateShopPage(shopID: shopID),
            false,
          );
          return;
        }

        if (value == texts[1]) {
          goToPage(
            context,
            const ProductsPage(),
            false,
          );
          return;
        }

        if (value == texts[2]) {
          // eger dukana degisli haryt yok bolsa
          // dukany korzina gos
          return;
        }
      },
    );
  }
}
