import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/parts/shop_pop_up_menu.dart';
import 'package:skar_admin/helpers/methods/dialogs.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/styles/colors.dart';

class PopUpMenus extends ConsumerWidget {
  const PopUpMenus({
    super.key,
    required this.shopID,
    required this.isDeleted,
  });

  final String shopID;
  final bool isDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    List<String> texts = isDeleted
        ? [lang.restore, lang.permanentlyDelete]
        : [lang.change, lang.viewProducts, lang.moveToTrash];

    List<IconData> icons = isDeleted
        ? [Icons.history, Icons.delete_forever]
        : [Icons.edit, Icons.local_mall, Icons.auto_delete];

    return PopupMenuButton(
      elevation: 3,
      color: elevatedButtonColor,
      itemBuilder: (context) => isDeleted
          ? [
              popUpMenuMethod(texts[0], icons[0]),
              popUpMenuMethod(texts[1], icons[1]),
            ]
          : [
              popUpMenuMethod(texts[0], icons[0]),
              popUpMenuMethod(texts[1], icons[1]),
              popUpMenuMethod(texts[2], icons[2]),
            ],
      onSelected: (value) async {
        if (!isDeleted) {
          if (value == texts[0]) {
            goToUpdateShopPage(context, shopID);
            return;
          }

          if (value == texts[1]) {
            await goToProductsPageOfShop(context, ref, shopID);
            return;
          }

          if (value == texts[2]) {
            // eger dukana degisli haryt yok bolsa
            // dukany korzina gos
            await shopMoveToTrash(context, ref, shopID, lang);
            return;
          }
          return;
        }

        if (value == texts[0]) {
          // bu yerde dukan korzinadan cykarylyar
          await restoreShop(context, ref, shopID, lang);
          return;
        }

        if (value == texts[1]) {
          // bu yerde dukan korzinadan cykarylyar
          await showDeleteDialog(context, ref, null, shopID);
          return;
        }
      },
    );
  }
}
