import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/database/functions/shop_owner.dart';

final hasShopOwnerProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    return await hasShopOwner();
  },
);
