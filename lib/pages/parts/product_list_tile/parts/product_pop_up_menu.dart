import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/parts/product_pop_up_menu.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductPopUpMenu extends ConsumerWidget {
  const ProductPopUpMenu({
    super.key,
    this.shopID,
    required this.productID,
  });

  final String? shopID;
  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    List<String> texts = shopID != null
        ? [lang.change, lang.moveToTrash]
        : [lang.restore, lang.permanentlyDelete];

    List<IconData> icons = shopID != null
        ? [Icons.edit, Icons.auto_delete]
        : [Icons.history, Icons.delete_forever];

    return PopupMenuButton(
      elevation: 3,
      color: elevatedButtonColor,
      itemBuilder: (context) => [
        popUpMenuMethod(texts[0], icons[0]),
        popUpMenuMethod(texts[1], icons[1]),
      ],
      onSelected: (value) async {
        if (shopID != null) {
          // Eger haryt korzinada dal bolsa bolmaly funksiyalar
          if (value == texts[0]) {
            goToEditProductPage(context, shopID, productID);
            return;
          }

          if (value == texts[1]) {
            // bu yerde haryt korzina oklanyar ( pozulyar )
            await productMoveToTrash(context, ref, shopID, productID, lang);
            return;
          }

          return;
        }

        if (value == texts[0]) {
          // bu yerde haryt korzinadan cykarylyar
          await restoreProduct(context, ref, productID, lang);
          return;
        }

        if (value == texts[1]) {
          // bu yerde haryt korzinadan pozulyar ( haryt doly pozulyar )
          await deletePermanentlyProduct(context, ref, productID, lang);
          return;
        }
      },
    );
  }
}
