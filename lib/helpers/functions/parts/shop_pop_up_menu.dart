import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/products/products.dart';
import 'package:skar_admin/providers/pages/products.dart';

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
