import 'package:skar_admin/models/shop_owner.dart';

class ShopOwnerApiService {
  Future<ShopOwner> login() async {
    return ShopOwner.defaultShopOwner();
  }
}
