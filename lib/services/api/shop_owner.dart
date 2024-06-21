import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop_owner.dart';

class ShopOwnerApiService {
  Future<ShopOwner> login() async {
    Uri uri = Uri.parse('$apiUrl/shop-owners/login');

    return ShopOwner.defaultShopOwner();
  }
}
