import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/internet_connection.dart';
import 'package:skar_admin/services/api/shop_owner.dart';

final shopOwnerApiServiceProvider =
    Provider<ShopOwnerApiService>((ref) => ShopOwnerApiService());

var loginShopOwnerProvider = FutureProvider.autoDispose
    .family<ResultLoginShopOwner, LoginShopOwnerParams>((ref, arg) async {
  ResultLoginShopOwner result = ResultLoginShopOwner.defaultResult();

  try {
    bool hasInternert =
        await ref.read(checkInternetConnProvider(arg.context).future);

    if (hasInternert) {
      ResponseLoginShopOwner responseLoginShopOwner = await ref
          .read(shopOwnerApiServiceProvider)
          .loginShopOwner(arg.phoneNumber, arg.password);

      result = ResultLoginShopOwner(
          error: '', responseLoginShopOwner: responseLoginShopOwner);
    }
  } catch (e) {
    result = ResultLoginShopOwner(error: e.toString());
  }

  return result;
});
