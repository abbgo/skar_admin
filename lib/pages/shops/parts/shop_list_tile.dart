import 'package:flutter/material.dart';
import 'package:skar_admin/models/shop.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(shop.nameTM),
    );
  }
}
