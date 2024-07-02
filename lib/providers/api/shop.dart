import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/providers/internet_connection.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    String shopOwnerID = '';
    try {
      if (!arg.isShoppingCenter!) {
        ShopOwner shopOwner = await ref.read(getShopOwnerProvider.future);
        shopOwnerID = shopOwner.id;
      }
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: arg.page!,
            shopOwnerID: shopOwnerID,
            isDeleted: arg.isDeleted!,
            isShoppingCenter: arg.isShoppingCenter!,
          );

      if (resultShop.error == 'auth error') {
        await ref.read(accessTokenProvider.notifier).update('');
      }
      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);

var createShopProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      bool hasInternert =
          await ref.read(checkInternetConnProvider(arg.context!).future);

      if (hasInternert) {
        String accessToken = await ref.read(accessTokenProvider);
        ResultShop resultShop = await ref.read(shopApiProvider).createShop(
              accessToken: accessToken,
              shop: arg.shop!,
            );

        if (resultShop.error == 'auth error') {
          await ref.read(accessTokenProvider.notifier).update('');
          if (arg.context!.mounted) Navigator.pop(arg.context!);
        }

        if (resultShop.error == 'some error') {
          if (arg.context!.mounted) showSomeErr(arg.context!);
        }

        result = resultShop;
      }
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);

var shopSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
