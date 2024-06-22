import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/styles/colors.dart';

class ShopOwnerInfo extends ConsumerWidget {
  const ShopOwnerInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ShopOwner> shopOwner = ref.read(getShopOwnerProvider);

    return shopOwner.when(
      data: (data) {
        return Card(
          color: elevatedButtonColor,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'AB',
                style: TextStyle(
                  color: elevatedButtonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadWidget,
    );
  }
}
