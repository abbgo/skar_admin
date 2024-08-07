import 'package:flutter/material.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/parts/shop_list_tile/parts/pop_up_menus.dart';
import 'package:skar_admin/pages/parts/shop_list_tile/parts/shop_list_tile_data.dart';
import 'package:skar_admin/pages/parts/list_tile_image.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({
    super.key,
    required this.shop,
    required this.isDeleted,
  });

  final Shop shop;
  final bool isDeleted;
  static const double cardHeight = 110;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: cardHeight,
      child: Card(
        child: Row(
          children: [
            ListTileImage(imagePath: shop.image!, cardHeight: cardHeight),
            ShopListTileData(shop: shop),
            PopUpMenus(shopID: shop.id!, isDeleted: isDeleted),
          ],
        ),
      ),
    );
  }
}
