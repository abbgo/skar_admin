import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';

goToUpdateShopPage(BuildContext context, String shopID) {
  goToPage(
    context,
    AddOrUpdateShopPage(shopID: shopID),
    false,
  );
}
