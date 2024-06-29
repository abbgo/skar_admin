import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/static_data.dart';

Widget showCachImageMethod(String image) {
  return image.isNotEmpty
      ? CachedNetworkImage(
          imageUrl: '$pathUrl/$image',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              loadWidget,
          errorWidget: (context, url, error) => errImage,
          fit: BoxFit.cover,
        )
      : errImage;
}
