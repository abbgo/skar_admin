import 'package:flutter/material.dart';
import 'package:skar_admin/pages/parts/select_image_bottom_sheet.dart';

showSelectedImageSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const SelectImageBottomSheet(),
  );
}
