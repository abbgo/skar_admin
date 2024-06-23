import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';

class ShopApiService {
  // fetch shops -------------------------------------------------------
  Future<List<Shop>> fetchShops({
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
      http.Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['shops'] == null) return [];
        var shopsList = jsonData['shops'] as List;
        return shopsList
            .map<Shop>((propJson) => Shop.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class ShopParams extends Equatable {
  final String? shopOwnerID;
  final bool? isDeleted;
  final int? page;

  const ShopParams({this.shopOwnerID, this.isDeleted, this.page});

  @override
  List<Object?> get props => [shopOwnerID, isDeleted, page];

  // ShopParams copyWith({String? shopOwnerID, bool? isDeleted, int? page}) {
  //   return ShopParams(
  //     shopOwnerID: shopOwnerID ?? this.shopOwnerID,
  //     isDeleted: isDeleted ?? this.isDeleted,
  //     page: page ?? this.page,
  //   );
  // }
}
