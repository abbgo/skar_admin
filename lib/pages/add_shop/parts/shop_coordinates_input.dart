import 'package:flutter/material.dart';
import 'package:skar_admin/pages/add_shop/parts/coordinate_input.dart';

class ShopCoordinatesInput extends StatelessWidget {
  const ShopCoordinatesInput({
    super.key,
    required this.latitudeCtrl,
    required this.longitudeCtrl,
  });

  final TextEditingController latitudeCtrl;
  final TextEditingController longitudeCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dukanyn kordinatalaryny girizin *'),
        const SizedBox(height: 10),
        Row(
          children: [
            CoordinateInput(ctrl: latitudeCtrl, label: 'Latitude *'),
            const SizedBox(width: 20),
            CoordinateInput(ctrl: longitudeCtrl, label: 'Longitude *'),
          ],
        ),
      ],
    );
  }
}
