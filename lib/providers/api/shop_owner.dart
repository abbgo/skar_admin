import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/services/api/shop_owner.dart';

final shopOwnerApiServiceProvider =
    Provider<ShopOwnerApiService>((ref) => ShopOwnerApiService());

var loginShopOwnerProvider = FutureProvider.autoDispose
    .family<ResultLoginShopOwner, LoginShopOwnerParams>((ref, params) async {
  ResultLoginShopOwner result = ResultLoginShopOwner.defaultResult();

  try {
    ResponseLoginShopOwner responseLoginShopOwner = await ref
        .read(shopOwnerApiServiceProvider)
        .loginShopOwner(params.phoneNumber, params.password);

    result = ResultLoginShopOwner(
        error: '', responseLoginShopOwner: responseLoginShopOwner);
  } catch (e) {
    result = ResultLoginShopOwner(error: e.toString());
  }

  return result;
});
