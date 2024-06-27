import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:skar_admin/providers/pages/add_shop.dart';

Future<void> getImage(WidgetRef ref, ImageSource imageSource) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);

  if (pickedFile != null) {
    final size = ImageSizeGetter.getSize(FileInput(File(pickedFile.path)));
    print('--------------------- jpg = $size');
    ref.read(shopImageProvider.notifier).state = File(pickedFile.path);
  }

  // _uploadImage(_image, userID, type);
}
