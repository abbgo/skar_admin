import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

Future<void> getImage(
  WidgetRef ref,
  ImageSource imageSource,
  String imageType,
) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);

  if (pickedFile != null) {
    bool trueDimensions =
        await checkImageDimensions(File(pickedFile.path), imageType);
    if (trueDimensions) {
      ref.read(shopImageProvider.notifier).state = File(pickedFile.path);
    }
  }

  // _uploadImage(_image, userID, type);
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
