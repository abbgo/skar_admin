import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';

class ShopApiService {
  // fetch shops -------------------------------------------------------
  Future<ResultShop> fetchShops({
    required String accessToken,
    required int page,
    required String shopOwnerID,
    required bool isDeleted,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/shops').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'shop_owner_id': shopOwnerID,
        'is_deleted': '$isDeleted',
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['shops'] == null) {
          return const ResultShop(shops: [], error: '');
        }

        var shopsList = jsonData['shops'] as List;
        return ResultShop(
          shops: shopsList
              .map<Shop>((propJson) => Shop.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultShop(shops: [], error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

  // create shops -------------------------------------------------------
  Future<ResultShop> createShop({
    required String accessToken,
    required Shop shop,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/shops');

    try {
      http.Response response = await http.post(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(shop.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultShop(message: '', error: '');
        }

        return ResultShop(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultShop(error: 'some error');
      }

      return const ResultShop(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class ShopParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final BuildContext? context;

  const ShopParams({this.isDeleted, this.page, this.context});

  @override
  List<Object?> get props => [isDeleted, page, context];
}
