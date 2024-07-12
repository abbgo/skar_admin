import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/pages/map.dart';
import 'package:skar_admin/providers/pages/shopping_center.dart';

class CameraPositionNotifier extends StateNotifier<CameraPosition> {
  CameraPositionNotifier()
      : super(
          const CameraPosition(target: LatLng(37.898429, 58.354480), zoom: 15),
        );

  Future<void> change(CameraPosition position) async {
    state = position;
  }
}

class MarkersNotifier extends StateNotifier<Set<Marker>> {
  MarkersNotifier() : super({});

  Future<void> setMarker(
    double latitude,
    double longitude,
    WidgetRef? ref,
  ) async {
    var marker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarker,
      onTap: () async {
        if (ref != null) {
          ref.read(latLongProvider.notifier).state = '$latitude $longitude';
        }
        String latLong = '$latitude $longitude';
        await Clipboard.setData(ClipboardData(text: latLong.toString()));
        if (ref != null) {
          ref.read(selectedShoppincCenterProvider.notifier).state =
              SelectedShop.defaultSelectedShop();
        }
      },
    );

    state = {...state, marker};
  }
}
