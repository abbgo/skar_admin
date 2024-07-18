import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:http/http.dart' as http;

class BrendApiService {
  // fetch brends
  Future<ResultBrend> fetchBrends({
    required String accessToken,
    required int page,
    required bool isDeleted,
    required String search,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/brends').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'is_deleted': '$isDeleted',
        'search': search,
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['brends'] == null) {
          return const ResultBrend(brends: null, error: '');
        }

        var brendsList = jsonData['brends'] as List;
        return ResultBrend(
          brends: brendsList
              .map<Brend>((propJson) => Brend.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultBrend(brends: null, error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class DefaultParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final BuildContext? context;

  const DefaultParams({this.isDeleted, this.page, this.context});

  @override
  List<Object?> get props => [isDeleted, page, context];
}
