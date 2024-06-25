import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_shop/parts/coordinate_input.dart';
import 'package:skar_admin/pages/map/map.dart';

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
        Row(
          children: [
            const Text('Dukanyn kordinatalaryny girizin *'),
            IconButton(
              onPressed: () => goToPage(context, const MapPage(), false),
              icon: const Icon(Icons.travel_explore),
            ),
          ],
        ),
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
