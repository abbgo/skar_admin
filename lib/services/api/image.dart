import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:http/http.dart' as http;
import 'package:skar_admin/models/image.dart';

class ImageApiService {
  Future<ResultImage> addOrUpdateImage(
    String imageType,
    String oldImage,
    String accessToken,
    File imageFile,
  ) async {
    Uri uri = Uri.parse('$apiUrl/back/image')
        .replace(queryParameters: {'image_type': imageType});

    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers["Authorization"] = 'Bearer $accessToken';
    request.fields['old_path'] = oldImage;
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      dynamic jsonData = json.decode(responseBody);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['image'] == null) {
          return const ResultImage(error: '');
        }
        return ResultImage(image: jsonData['image'] as String, error: '');
      }

      if (response.statusCode == 400) {
        return const ResultImage(error: 'some error');
      }

      return const ResultImage(error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class ImageParams extends Equatable {
  final String imageType;
  final String oldImage;
  final File imageFile;
  final BuildContext context;

  const ImageParams({
    required this.imageType,
    required this.oldImage,
    required this.imageFile,
    required this.context,
  });

  @override
  List<Object?> get props => [imageType, oldImage, imageFile, context];
}
