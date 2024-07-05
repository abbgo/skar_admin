import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class ShopListTileData extends StatelessWidget {
  const ShopListTileData({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer(
          builder: (context, ref, child) {
            bool isTM = ref.watch(langProvider) == 'tr';

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  isTM ? shop.nameTM : shop.nameRU,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  shop.hasShipping!
                      ? 'assets/icons/has_shipping.png'
                      : 'assets/icons/no_shipping.png',
                  height: 25,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
