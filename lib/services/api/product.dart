import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  // fetch count of products -------------------------------------------------------
  Future<ResultProduct> fetchCountOfProducts({
    required String accessToken,
    required String shopID,
    required bool isDeleted,
    required String search,
    required String lang,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/products/count').replace(
      queryParameters: {
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
        if (jsonData['count'] == 0) {
          return const ResultProduct(count: 0, error: '');
        }

        var count = jsonData['count'] as int;
        return ResultProduct(count: count, error: '');
      }
      return const ResultProduct(count: 0, error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

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
          return const ResultProduct(products: null, error: '');
        }

        var productsList = jsonData['products'] as List;
        return ResultProduct(
          products: productsList
              .map<Product>((propJson) => Product.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultProduct(products: null, error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

  // update product -------------------------------------------------------
  Future<ResultProduct> updateProduct(
      {required String accessToken, required Product product}) async {
    Uri uri = Uri.parse('$apiUrl/back/products');

    try {
      http.Response response = await http.put(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(product.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultProduct(message: '', error: '');
        }

        return ResultProduct(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultProduct(error: 'some error');
      }

      return const ResultProduct(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

  // create product -------------------------------------------------------
  Future<ResultProduct> createProduct(
      {required String accessToken, required Product product}) async {
    Uri uri = Uri.parse('$apiUrl/back/products');

    try {
      http.Response response = await http.post(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(product.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultProduct(message: '', error: '');
        }

        return ResultProduct(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultProduct(error: 'some error');
      }

      return const ResultProduct(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

// fetch product -------------------------------------------------------
  Future<ResultProduct> fetchProduct({
    required String accessToken,
    required String productID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/products/$productID');

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['product'] == null) {
          return ResultProduct(product: Product.defaultProduct(), error: '');
        }

        return ResultProduct(
          product: Product.fromJson(jsonData['product']),
          error: '',
        );
      }
      return ResultProduct(
        product: Product.defaultProduct(),
        error: 'auth error',
      );
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
  final BuildContext? context;
  final String? productID;

  const ProductParams({
    this.isDeleted,
    this.page,
    this.product,
    this.shopID,
    this.context,
    this.productID,
  });

  @override
  List<Object?> get props =>
      [isDeleted, page, product, shopID, context, productID];
}
