import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/select_image_bottom_sheet.dart';

showSelectedImageSheet(
  BuildContext context,
  String imageType,
  double ratioX,
  double ratioY,
  bool showRmBack,
) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SelectImageBottomSheet(
      imageType: imageType,
      ratioX: ratioX,
      ratioY: ratioY,
      showRmBack: showRmBack,
    ),
  );
}
