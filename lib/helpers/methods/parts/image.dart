import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/static_data.dart';

CachedNetworkImage showCachImageMethod(String image) {
  return CachedNetworkImage(
    imageUrl: '$pathUrl/$image',
    progressIndicatorBuilder: (context, url, downloadProgress) => loadWidget,
    errorWidget: (context, url, error) => errImage,
    fit: BoxFit.cover,
  );
}
