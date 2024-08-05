import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/complaint_product.dart';

class ComplaintProductApiService {
  // fetch complaint products --------------------------------------------------
  Future<ResultComplaintProduct> fetchComplaintProducts({
    required String accessToken,
    required int page,
    required String shopOwnerID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/complaint-products').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'shop_owner_id': shopOwnerID,
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['complaint_products'] == null) {
          return const ResultComplaintProduct(complaintProducts: [], error: '');
        }

        var dataList = jsonData['complaint_products'] as List;
        return ResultComplaintProduct(
          complaintProducts: dataList
              .map<ComplaintProduct>(
                (propJson) => ComplaintProduct.fromJson(propJson),
              )
              .toList(),
          error: '',
        );
      }
      return const ResultComplaintProduct(
        complaintProducts: [],
        error: 'auth error',
      );
    } catch (e) {
      rethrow;
    }
  }
}

class ComplaintProductParams extends Equatable {
  final int? page;
  final BuildContext? context;
  final String? shopOwnerID;

  const ComplaintProductParams({this.page, this.context, this.shopOwnerID});

  @override
  List<Object?> get props => [page, context, shopOwnerID];
}
