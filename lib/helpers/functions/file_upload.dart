import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skar_admin/models/image.dart';
import 'package:skar_admin/providers/api/image.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/add_or_update_shop.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';
import 'package:skar_admin/services/api/image.dart';

Future<void> addOrUpdateImage(
  WidgetRef ref,
  File file,
  BuildContext context,
  String imageType,
) async {
  ref.read(loadSendImageProvider.notifier).state = true;
  String oldShopImagePath =
      imageType == 'product' ? '' : ref.read(shopImagePathProvider);

  ImageParams params = ImageParams(
    imageType: imageType,
    oldImage: oldShopImagePath,
    imageFile: file,
    context: context,
  );
  ResultImage resultImage =
      await ref.watch(addOrUpdateImageProvider(params).future);

  if (resultImage.image != null) {
    int lengthSelectedImages = ref.read(productImagesProvider).length;
    if (imageType == 'product') {
      ProductColorImage selectedImage = ProductColorImage(
          image: resultImage.image!, orderNumber: lengthSelectedImages + 1);
      ref.read(productImagesProvider.notifier).addImage(selectedImage);
    } else {
      ref.read(shopImagePathProvider.notifier).state = resultImage.image!;
    }
  }
  ref.read(loadSendImageProvider.notifier).state = false;
}

Future<void> getImageFromCamera(
  WidgetRef ref,
  String imageType,
  BuildContext context,
  double ratioX,
  double ratioY,
) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
    );

    if (croppedFile != null) {
      File file = File(croppedFile.path);
      if (context.mounted) {
        await addOrUpdateImage(ref, file, context, imageType);
      }
    }
  }
}

Future<void> getImageFromFolder(
  WidgetRef ref,
  String imageType,
  BuildContext context,
  double ratioX,
  double ratioY,
) async {
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['jpg'],
  );

  if (pickedFile != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.files.single.path!,
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
    );

    if (croppedFile != null) {
      File file = File(croppedFile.path);
      if (context.mounted) {
        await addOrUpdateImage(ref, file, context, imageType);
      }
    }
  }
}

// Future<bool> checkImageDimensions(File imageFile, String imageType) async {
//   bool result = true;

//   final Completer<ui.Image> completer = Completer<ui.Image>();
//   final ImageStream imageStream =
//       FileImage(imageFile).resolve(ImageConfiguration.empty);
//   final ImageStreamListener listener =
//       ImageStreamListener((ImageInfo info, bool synchronousCall) {
//     completer.complete(info.image);
//   });

//   imageStream.addListener(listener);
//   final ui.Image image = await completer.future;
//   double width = image.width.toDouble();
//   double height = image.height.toDouble();

//   switch (imageType) {
//     case 'shop':
//       if (width != 1800 || height != 4000) {
//         result = false;
//       }
//   }

//   return result;
// }
