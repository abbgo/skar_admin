import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/complaint.dart';
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

  // fetch product complaints --------------------------------------------------
  Future<ResultComplaint> fetchProductComplaints({
    required String accessToken,
    required int page,
    required String productID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/complaint-products/$productID')
        .replace(queryParameters: {'limit': '10', 'page': '$page'});

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['product_complaints'] == null) {
          return const ResultComplaint(complaints: [], error: '');
        }

        var dataList = jsonData['product_complaints'] as List;
        return ResultComplaint(
          complaints: dataList
              .map<Complaint>(
                (propJson) => Complaint.fromJson(propJson),
              )
              .toList(),
          error: '',
        );
      }
      return const ResultComplaint(
        complaints: [],
        error: 'auth error',
      );
    } catch (e) {
      rethrow;
    }
  }
}

class ComplaintParams extends Equatable {
  final int? page;
  final BuildContext? context;
  final String? productID;

  const ComplaintParams({this.page, this.context, this.productID});

  @override
  List<Object?> get props => [page, context, productID];
}
