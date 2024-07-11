import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar_admin/notifiers/pages/map.dart';

final locationPermissionProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final loadProvider = StateProvider.autoDispose<bool>((ref) => true);
final latLongProvider = StateProvider.autoDispose<String>((ref) => '');

final cameraPositionProvider =
    StateNotifierProvider<CameraPositionNotifier, CameraPosition>(
  (ref) => CameraPositionNotifier(),
);

final markersProvider =
    StateNotifierProvider.autoDispose<MarkersNotifier, Set<Marker>>(
  (ref) => MarkersNotifier(),
);
