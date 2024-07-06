import 'dart:convert';

import 'package:skar_admin/helpers/static_data.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  // fetch categroies --------------------------------------------
  Future<ResultBrend> fetchCategories() async {
    Uri uri = Uri.parse('$apiUrl/categories');

    try {
      http.Response response = await http.get(
        uri,
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['brends'] == null) {
          return const ResultBrend(brends: [], error: '');
        }

        var brendsList = jsonData['brends'] as List;
        return ResultBrend(
          brends: brendsList
              .map<Brend>((propJson) => Brend.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultBrend(brends: [], error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}
