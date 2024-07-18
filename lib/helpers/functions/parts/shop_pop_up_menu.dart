import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/products/products.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/providers/pages/shops.dart';
import 'package:skar_admin/services/api/product.dart';

goToUpdateShopPage(BuildContext context, String shopID) {
  goToPage(
    context,
    AddOrUpdateShopPage(shopID: shopID),
    false,
  );
}

Future<void> goToProductsPageOfShop(
  BuildContext context,
  WidgetRef ref,
  String shopID,
) async {
  ref.read(productSearchProvider.notifier).state = '';
  goToPage(
    context,
    ProductsPage(shopID: shopID),
    false,
  );
}

Future<void> shopMoveToTrash(
  BuildContext context,
  WidgetRef ref,
  String shopID,
) async {
  ref.read(loadDeleteShopProvider.notifier).state = true;

  ProductParams params =
      ProductParams(isDeleted: false, shopID: shopID, context: context);
  ResultProduct countOfProducts =
      await ref.watch(fetchCountOfProductsProvider(params).future);

  if (countOfProducts.count != 0) {
    print('-------------- bu dukany pozup bolanok');
  } else {
    print('-------------- bu dukany pozup bolyar');
  }

  ref.read(loadDeleteShopProvider.notifier).state = false;
}
