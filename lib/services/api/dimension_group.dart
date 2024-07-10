import 'dart:convert';

import 'package:skar_admin/helpers/functions/static_data.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/dimension_group.dart';
import 'package:http/http.dart' as http;

class DimensionGroupApiService {
  // fetch dimension groups with dimensions
  Future<ResultDimensionGroup> fetchDimensionGroupsWithDimensions({
    required String accessToken,
    required int page,
    required bool isDeleted,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/dimension-groups').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
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
        if (jsonData['dimension_groups'] == null) {
          return const ResultDimensionGroup(dimensionGroups: [], error: '');
        }

        var dimensionGroupsList = jsonData['dimension_groups'] as List;
        return ResultDimensionGroup(
          dimensionGroups: dimensionGroupsList
              .map<DimensionGroup>(
                (propJson) => DimensionGroup.fromJson(propJson),
              )
              .toList(),
          error: '',
        );
      }
      return const ResultDimensionGroup(
        dimensionGroups: [],
        error: 'auth error',
      );
    } catch (e) {
      rethrow;
    }
  }
}
