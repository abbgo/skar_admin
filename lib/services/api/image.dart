import 'dart:convert';
import 'dart:io';

import 'package:skar_admin/helpers/static_data.dart';
import 'package:http/http.dart' as http;

class ImageApiService {
  Future<String> addOrUpdateImage(
    String imageType,
    String token,
    File image,
  ) async {
    Uri uri = Uri.parse('$apiUrl/back/image')
        .replace(queryParameters: {'image_type': imageType});

    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('img', image.path));

    try {
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      dynamic jsonData = json.decode(responseBody);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['image'] == null) {
          return '';
        }
        return jsonData['image'] as String;
      }
    } catch (e) {}

    return '';
  }
}
