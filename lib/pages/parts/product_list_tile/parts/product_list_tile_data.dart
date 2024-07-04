import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class ProductListTileData extends StatelessWidget {
  const ProductListTileData({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer(
          builder: (context, ref, child) {
            bool isTM = ref.watch(langProvider) == 'tr';

            return Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              isTM ? product.nameTM : product.nameRU,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
