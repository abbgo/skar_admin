import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
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
        ResultImage resultImage =
            await ref.read(imageApiServiceProvider).addOrUpdateImage(
                  arg.imageType!,
                  arg.oldImage!,
                  accessToken,
                  arg.imageFile!,
                );

        if (resultImage.error == 'auth error') {
          await ref.read(accessTokenProvider.notifier).update('');
          if (arg.context.mounted) Navigator.pop(arg.context);
        }

        if (resultImage.error == 'some error') {
          if (arg.context.mounted) showSomeErr(arg.context);
        }

        result = resultImage;
      }
    } catch (e) {
      result = ResultImage(error: e.toString());
    }

    return result;
  },
);

var deleteImageProvider =
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
            .deleteImage(accessToken, arg.oldImage!);

        if (resultImage.error == 'auth error') {
          await ref.read(accessTokenProvider.notifier).update('');
          if (arg.context.mounted) Navigator.pop(arg.context);
        }

        if (resultImage.error == 'some error') {
          if (arg.context.mounted) showSomeErr(arg.context);
        }

        result = resultImage;
      }
    } catch (e) {
      result = ResultImage(error: e.toString());
    }
    return result;
  },
);
