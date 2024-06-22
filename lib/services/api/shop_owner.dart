import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:http/http.dart' as http;

class ShopOwnerApiService {
  Future<ResponseLoginShopOwner> loginShopOwner(
      String phoneNumber, String password) async {
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

    return ResponseLoginShopOwner.defaultResponse();
  }
}

class LoginShopOwnerParams extends Equatable {
  final String phoneNumber;
  final String password;

  const LoginShopOwnerParams({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber, password];
}
