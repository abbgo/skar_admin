import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/providers/internet_connection.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/image.dart';

final imageApiServiceProvider =
    Provider<ImageApiService>((ref) => ImageApiService());

var addOrUpdateImageProvider =
    FutureProvider.autoDispose.family<ResultImage, ImageParams>(
  (ref, arg) async {
    ResultImage result = ResultImage.defaultResult();

    try {
      bool hasInternert =
          await ref.read(checkInternetConnProvider(arg.context).future);

      if (hasInternert) {
        String accessToken = await ref.read(accessTokenProvider);
        ResultImage resultImage = await ref
            .read(imageApiServiceProvider)
            .addOrUpdateImage(arg.imageType, accessToken, arg.imageFile);

        if (result.error == 'auth error') {
          await ref.read(accessTokenProvider.notifier).update('');
        }

        result = resultImage;
      }
    } catch (e) {
      result = ResultImage(error: e.toString());
    }

    return result;
  },
);
