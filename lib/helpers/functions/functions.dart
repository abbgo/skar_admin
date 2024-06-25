import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skar_admin/datas/screen.dart';
import 'package:skar_admin/helpers/functions/permssion.dart';
import 'package:skar_admin/providers/pages/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

ScreenProperties screenProperties(BuildContext context) {
  ScreenProperties screenProperties = ScreenProperties(0, 0, 0);

  screenProperties.width = MediaQuery.of(context).size.width;
  screenProperties.height = MediaQuery.of(context).size.height;
  screenProperties.topSafeArea = MediaQuery.of(context).viewPadding.top;

  return screenProperties;
}

Future<Position> getCurrentLocation() async {
  return await Geolocator.getCurrentPosition();
}

void permissionHandler(WidgetRef ref) async {
  var loadNotifier = ref.read(loadProvider.notifier);
  var locationPermissionNotifier =
      ref.read(locationPermissionProvider.notifier);

  bool hasPermission = await checkAndGetCurrentLocation(ref);
  loadNotifier.state = false;
  if (hasPermission) {
    locationPermissionNotifier.state = true;
  }
}

Future<bool> checkAndGetCurrentLocation(WidgetRef ref) async {
  bool hasPermission = await hasLocationPermission();

  if (hasPermission) {
    getCurrentLocation().then((value) async {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 15,
      );

      await ref.read(cameraPositionProvider.notifier).change(cameraPosition);

      await ref
          .read(markersProvider.notifier)
          .setMarker(value.latitude, value.longitude, ref);
    });
  }
  return hasPermission;
}
