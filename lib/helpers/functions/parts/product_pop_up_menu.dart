import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';

goToEditProductPage(BuildContext context, String? shopID, String productID) {
  goToPage(
    context,
    AddOrUpdateProductPage(shopID: shopID!, productID: productID),
    false,
  );
}
