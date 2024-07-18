import 'dart:convert';

import 'package:skar_admin/helpers/static_data.dart';
import 'package:http/http.dart' as http;
import 'package:skar_admin/models/category.dart';

class CategoryApiService {
  // fetch categroies --------------------------------------------
  Future<ResultCategory> fetchCategories(
    String search,
    int page,
    String lang,
  ) async {
    Uri uri = Uri.parse('$apiUrl/categories').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'search': search,
        'lang': lang
      },
    );

    try {
      http.Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['categories'] == null) {
          return const ResultCategory(categories: [], error: '');
        }

        var categoriesList = jsonData['categories'] as List;
        return ResultCategory(
          categories: categoriesList
              .map<Category>((propJson) => Category.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultCategory(categories: [], error: '');
    } catch (e) {
      rethrow;
    }
  }
}
