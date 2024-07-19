import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/pages/shops/parts/result_shops.dart';
import 'package:skar_admin/providers/pages/shops.dart';

class ShopsPage extends ConsumerWidget {
  const ShopsPage({super.key, this.isDeleted});

  final bool? isDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool loadDeleteShop = ref.watch(loadDeleteShopProvider);

    return isDeleted!
        ? Scaffold(
            body: Stack(
              children: [
                ResultShops(isDeleted: isDeleted),
                loadDeleteShop ? loadProcess : const SizedBox(),
              ],
            ),
          )
        : Stack(
            children: [
              ResultShops(isDeleted: isDeleted),
              loadDeleteShop ? loadProcess : const SizedBox(),
            ],
          );
  }
}
