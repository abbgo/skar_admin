import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final locationPermissionProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final loadProvider = StateProvider.autoDispose<bool>((ref) => true);
final latLongProvider = StateProvider.autoDispose<String>((ref) => '');

// CAMERA POSITION NOTIFIER AND PROVIDER ---------------------------------------
class CameraPositionNotifier extends StateNotifier<CameraPosition> {
  CameraPositionNotifier()
      : super(
          const CameraPosition(target: LatLng(37.898429, 58.354480), zoom: 15),
        );

  Future<void> change(CameraPosition position) async {
    state = position;
  }
}

final cameraPositionProvider =
    StateNotifierProvider<CameraPositionNotifier, CameraPosition>(
  (ref) => CameraPositionNotifier(),
);

// MARKER NOTIFIER AND PROVIDER ------------------------------------------------
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
      },
    );

    state = {...state, marker};
  }
}

final markersProvider =
    StateNotifierProvider.autoDispose<MarkersNotifier, Set<Marker>>(
  (ref) => MarkersNotifier(),
);
