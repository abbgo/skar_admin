import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/services/api/image.dart';

final imageApiServiceProvider =
    Provider<ImageApiService>((ref) => ImageApiService());

var addOrUpdateImageProvider =
    FutureProvider.autoDispose.family<ResultImage, ImageParams>(
  (ref, arg) async {},
);
