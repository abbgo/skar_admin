import 'package:http/http.dart' as http;
import 'package:skar_admin/helpers/static_data.dart';

class ComplaintProductApiService {
  // fetch complaint products --------------------------------------------------
  Future<ResultBrend> fetchComplaintProducts({
    required String accessToken,
    required int page,
    required String shopOwnerID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/complaint-products/$shopOwnerID').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'shop_owner_id': shopOwnerID
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
