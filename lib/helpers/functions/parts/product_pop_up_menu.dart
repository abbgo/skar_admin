import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/dialogs.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/services/api/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

goToEditProductPage(BuildContext context, String? shopID, String productID) {
  goToPage(
    context,
    AddOrUpdateProductPage(shopID: shopID!, productID: productID),
    false,
  );
}

Future<void> productMoveToTrash(
  BuildContext context,
  WidgetRef ref,
  String? shopID,
  String productID,
  AppLocalizations lang,
) async {
  ref.read(loadDeleteProductProvider.notifier).state = true;

  ProductParams params = ProductParams(productID: productID, context: context);
  ResultProduct resultProduct =
      await ref.watch(deleteProductProvider(params).future);

  ref.read(loadDeleteProductProvider.notifier).state = false;

  if (resultProduct.error == '') {
    ref.invalidate(fetchProductsProvider);
    ref.invalidate(fetchCountOfProductsProvider);

    if (context.mounted) {
      showSuccess(context, lang.informationDeletedSuccessfully);
    }
  }
}

Future<void> restoreProduct(
  BuildContext context,
  WidgetRef ref,
  String productID,
  AppLocalizations lang,
) async {
  ref.read(loadDeleteProductProvider.notifier).state = true;

  ProductParams params = ProductParams(productID: productID, context: context);
  ResultProduct resultProduct =
      await ref.watch(restoreProductProvider(params).future);

  ref.read(loadDeleteProductProvider.notifier).state = false;

  if (resultProduct.error == '') {
    ref.invalidate(fetchProductsProvider);
    ref.invalidate(fetchCountOfProductsProvider);

    if (context.mounted) {
      showSuccess(context, lang.informationRestoredSuccessfully);
    }
  }
}

Future<void> deletePermanentlyProduct(
  BuildContext context,
  WidgetRef ref,
  String productID,
  AppLocalizations lang,
) async {
  await showDeleteDialog(context);
  // ref.read(loadDeleteProductProvider.notifier).state = true;

  // ProductParams params = ProductParams(productID: productID, context: context);
  // ResultProduct resultProduct =
  //     await ref.watch(deletePermanentlyProductProvider(params).future);

  // ref.read(loadDeleteProductProvider.notifier).state = false;

  // if (resultProduct.error == '') {
  //   ref.invalidate(fetchProductsProvider);
  //   ref.invalidate(fetchCountOfProductsProvider);

  //   if (context.mounted) {
  //     showSuccess(context, lang.informationCompletelyDeleted);
  //   }
  // }
}
