import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/parts/shop_pop_up_menu.dart';
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

    List<String> texts = [lang.change, lang.viewProducts, lang.moveToTrash];

    return PopupMenuButton(
      elevation: 3,
      color: elevatedButtonColor,
      itemBuilder: (context) => [
        popUpMenuMethod(texts[0], Icons.edit),
        popUpMenuMethod(texts[1], Icons.local_mall),
        popUpMenuMethod(texts[2], Icons.auto_delete),
      ],
      onSelected: (value) async {
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
      },
    );
  }
}
