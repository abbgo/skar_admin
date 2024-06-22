import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:http/http.dart' as http;

class ShopOwnerApiService {
  Future<ResponseLoginShopOwner> loginShopOwner(
      String phoneNumber, String password) async {
    Uri uri = Uri.parse('$apiUrl/shop-owners/login');
    Map<String, dynamic> data = {
      'phone_number': phoneNumber,
      'password': password,
    };

    try {
      http.Response response = await http.post(
        uri,
        body: json.encode(data),
      );
      dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        return ResponseLoginShopOwner.fromJson(jsonData);
      }
      return ResponseLoginShopOwner.defaultResponse();
    } catch (e) {
      rethrow;
    }
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
