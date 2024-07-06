import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  // fetch products -------------------------------------------------------
  Future<ResultProduct> fetchProducts({
    required String accessToken,
    required int page,
    required String shopID,
    required bool isDeleted,
    required String search,
    required String lang,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/products').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'shop_id': shopID,
        'is_deleted': '$isDeleted',
        'search': search,
        'lang': lang,
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['products'] == null) {
          return const ResultProduct(products: [], error: '');
        }

        var productsList = jsonData['products'] as List;
        return ResultProduct(
          products: productsList
              .map<Product>((propJson) => Product.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultProduct(products: [], error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class ProductParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final Product? product;
  final String? shopID;

  const ProductParams({
    this.isDeleted,
    this.page,
    this.product,
    this.shopID,
  });

  @override
  List<Object?> get props => [isDeleted, page, product, shopID];
}
