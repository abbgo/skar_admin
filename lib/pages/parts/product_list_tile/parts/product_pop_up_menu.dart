import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductPopUpMenu extends StatelessWidget {
  const ProductPopUpMenu({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    List<String> texts = [lang.change, lang.moveToTrash];

    return PopupMenuButton(
      elevation: 3,
      color: elevatedButtonColor,
      itemBuilder: (context) => [
        popUpMenuMethod(texts[0], Icons.edit),
        popUpMenuMethod(texts[1], Icons.auto_delete),
      ],
      onSelected: (value) {
        if (value == texts[0]) {
          goToPage(
            context,
            const AddOrUpdateShopPage(shopID: ''),
            false,
          );
          return;
        }

        if (value == texts[1]) {
          // eger dukana degisli haryt yok bolsa
          // dukany korzina gos
          return;
        }
      },
    );
  }
}
