import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/helpers/methods/parts/shop_list_tile.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/services/api/product.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductPopUpMenu extends ConsumerWidget {
  const ProductPopUpMenu({
    super.key,
    required this.shopID,
    required this.productID,
  });

  final String shopID;
  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    List<String> texts = [lang.change, lang.moveToTrash];

    return PopupMenuButton(
      elevation: 3,
      color: elevatedButtonColor,
      itemBuilder: (context) => [
        popUpMenuMethod(texts[0], Icons.edit),
        popUpMenuMethod(texts[1], Icons.auto_delete),
      ],
      onSelected: (value) async {
        if (value == texts[0]) {
          goToPage(
            context,
            AddOrUpdateProductPage(shopID: shopID, productID: productID),
            false,
          );
          return;
        }

        if (value == texts[1]) {
          // bu yerde haryt korzina oklanyar ( pozulyar )
          ref.read(loadDeleteProductProvider.notifier).state = true;

          ProductParams params =
              ProductParams(productID: productID, context: context);
          ResultProduct resultProduct =
              await ref.watch(deleteProductProvider(params).future);

          ref.read(loadDeleteProductProvider.notifier).state = false;

          if (resultProduct.error == '') {
            ref.invalidate(fetchProductsProvider);
            if (context.mounted) {
              showSuccess(context, lang.informationDeletedSuccessfully);
            }
          }
          return;
        }
      },
    );
  }
}
