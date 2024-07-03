import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/add_or_update_shop/add_or_update_shop.dart';
import 'package:skar_admin/pages/parts/shop_list_tile/parts/shop_list_tile_data.dart';
import 'package:skar_admin/pages/parts/shop_list_tile/parts/shop_list_tile_image.dart';
import 'package:skar_admin/styles/colors.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({super.key, required this.shop});

  final Shop shop;
  static const double cardHeight = 110.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: cardHeight,
      child: Card(
        child: Row(
          children: [
            ShopListTileImage(shop: shop, cardHeight: cardHeight),
            ShopListTileData(shop: shop),
            IconButton(
              onPressed: () => goToPage(
                context,
                AddOrUpdateShopPage(shopID: shop.id!),
                false,
              ),
              icon:
                  const Icon(Icons.border_color, color: Colors.white, size: 16),
              style: IconButton.styleFrom(backgroundColor: elevatedButtonColor),
            ),
          ],
        ),
      ),
    );
  }
}
