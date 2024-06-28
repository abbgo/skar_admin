import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skar_admin/providers/api/image.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';
import 'package:skar_admin/providers/parts/file_upload.dart';
import 'package:skar_admin/services/api/image.dart';

Future<void> sendImage(
  WidgetRef ref,
  File file,
  BuildContext context,
  String imageType,
) async {
  bool trueDimensions = await checkImageDimensions(file, imageType);

  if (trueDimensions && context.mounted) {
    ref.read(loadSendImageProvider.notifier).state = true;

    ImageParams params = ImageParams(
      imageType: 'shop',
      imageFile: file,
      context: context,
    );
    await ref.watch(addOrUpdateImageProvider(params).future);

    ref.read(shopImageProvider.notifier).state = file;
    ref.read(isTrueImageProvider.notifier).state = true;
    ref.read(loadSendImageProvider.notifier).state = false;
    return;
  }

  ref.read(isTrueImageProvider.notifier).state = false;
}

Future<void> getImageFromCamera(
  WidgetRef ref,
  String imageType,
  BuildContext context,
) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    File file = File(pickedFile.path);
    if (context.mounted) await sendImage(ref, file, context, imageType);
  }
}

Future<void> getImageFromFolder(
  WidgetRef ref,
  String imageType,
  BuildContext context,
) async {
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['jpg'],
  );

  if (pickedFile != null) {
    File file = File(pickedFile.files.single.path!);
    if (context.mounted) await sendImage(ref, file, context, imageType);
  }
}

Future<bool> checkImageDimensions(File imageFile, String imageType) async {
  bool result = true;

  final Completer<ui.Image> completer = Completer<ui.Image>();
  final ImageStream imageStream =
      FileImage(imageFile).resolve(ImageConfiguration.empty);
  final ImageStreamListener listener =
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
    completer.complete(info.image);
  });

  imageStream.addListener(listener);
  final ui.Image image = await completer.future;
  double width = image.width.toDouble();
  double height = image.height.toDouble();

  switch (imageType) {
    case 'shop':
      if (width != 1800 || height != 4000) {
        result = false;
      }
  }

  return result;
}
