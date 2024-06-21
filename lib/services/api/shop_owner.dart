import 'dart:convert';

import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:http/http.dart' as http;

class ShopOwnerApiService {
  Future<ShopOwner> loginShopOwner(String phoneNumber, String password) async {
    Uri uri = Uri.parse('$apiUrl/shop-owners/login');

    try {
      http.Response response = await http.post(
        uri,
        body: {'phone_number': phoneNumber, 'password': password},
      );
      dynamic jsonData = json.decode(response.body);
      print('------------------');
      print(jsonData);
    } catch (e) {
      print('-------------------');
      print(e.toString());
    }

    return ShopOwner.defaultShopOwner();
  }
}
