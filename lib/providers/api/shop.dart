import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/providers/internet_connection.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/add_or_update_shop.dart';
import 'package:skar_admin/providers/pages/shopping_center.dart';
import 'package:skar_admin/providers/pages/shops.dart';
import 'package:skar_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());

var fetchShopProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref
          .read(shopApiProvider)
          .fetchShop(accessToken: accessToken, shopID: arg.shopID!);

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.shop != null) {
        ref.read(hasShippingProvider.notifier).state =
            resultShop.shop!.hasShipping!;

        ref.read(shopImagePathProvider.notifier).state =
            resultShop.shop!.image!;

        ref.read(selectedShoppincCenterProvider.notifier).state =
            resultShop.shop!.parentShop!;
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);

var fetchShoppingCentersProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      String search = ref.watch(shoppingCenterSearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: arg.page!,
            shopOwnerID: '',
            isDeleted: arg.isDeleted!,
            isShoppingCenter: true,
            search: search,
            lang: isTM ? 'tm' : 'ru',
          );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.shops != null) {
        ref.read(hasShoppingCenterProvider.notifier).state =
            resultShop.shops!.isNotEmpty;
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      ShopOwner shopOwner = await ref.read(getShopOwnerProvider.future);
      bool isTM = ref.read(langProvider) == 'tr';

      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: arg.page!,
            shopOwnerID: shopOwner.id,
            isDeleted: arg.isDeleted!,
            isShoppingCenter: false,
            search: '',
            lang: isTM ? 'tm' : 'ru',
          );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.shops != null) {
        ref.read(hasShopsProvider.notifier).state =
            resultShop.shops!.isNotEmpty;
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

        await wrongToken(resultShop.error, ref, arg.context);

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

var updateShopProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      bool hasInternert =
          await ref.read(checkInternetConnProvider(arg.context!).future);

      if (hasInternert) {
        String accessToken = await ref.read(accessTokenProvider);
        ResultShop resultShop = await ref.read(shopApiProvider).updateShop(
              accessToken: accessToken,
              shop: arg.shop!,
            );

        await wrongToken(resultShop.error, ref, arg.context);

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
