import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer(
        builder: (context, ref, child) {
          bool isTM = ref.watch(langProvider) == 'tr';
          return Text(isTM ? shop.nameTM : shop.nameRU);
        },
      ),
    );
  }
}
