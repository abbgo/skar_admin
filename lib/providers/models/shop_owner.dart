import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/services/api/shop_owner.dart';

var loginShopOwnerProvider = FutureProvider.autoDispose
    .family<ResultLoginShopOwner, LoginShopOwnerParams>((ref, params) async {
  ResultLoginShopOwner result = ResultLoginShopOwner.defaultResult();
  return result;
});
