import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/shop_parents.dart';
import 'package:skar_admin/services/api/shop.dart';
import 'package:skar_admin/styles/colors.dart';

class ResultShopParents extends ConsumerWidget {
  const ResultShopParents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasShops = ref.watch(hasShopsProvider);
    bool isTM = ref.watch(langProvider) == 'tr';
    String selectedShoppincCenter = ref.watch(selectedShoppincCenterProvider);

    return !hasShops
        ? const NoResult()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                ShopParams shopParams =
                    ShopParams(page: page, isDeleted: false);
                final AsyncValue<ResultShop> shops =
                    ref.watch(fetchShoppingCentersProvider(shopParams));

                return shops.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '') {
                      return null;
                    }
                    if (indexInPage >= response.shops!.length) {
                      return null;
                    }
                    Shop shop = response.shops![indexInPage];
                    bool selected = selectedShoppincCenter == shop.id;
                    return Card(
                      color: selected ? elevatedButtonColor : null,
                      child: ListTile(
                        title: Text(
                          isTM ? shop.nameTM : shop.nameRU,
                          style:
                              TextStyle(color: selected ? Colors.white : null),
                        ),
                        onTap: () => ref
                            .read(selectedShoppincCenterProvider.notifier)
                            .state = shop.id!,
                      ),
                    );
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => null,
                );
              },
            ),
          );
  }
}
