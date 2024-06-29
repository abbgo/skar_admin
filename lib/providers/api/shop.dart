import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      ShopOwner shopOwner = await ref.read(getShopOwnerProvider.future);
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: arg.page!,
            shopOwnerID: shopOwner.id,
            isDeleted: arg.isDeleted!,
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

// var createShopProvider =
//     FutureProvider.autoDispose.family<ResultShop, ShopParams>(_createFn);
