import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skar_admin/providers/pages/map.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Set<Marker> markers = ref.watch(markersProvider);
        CameraPosition cameraPosition = ref.watch(cameraPositionProvider);

        ref.listen(
          cameraPositionProvider,
          (previous, next) async {
            GoogleMapController controller = await _mapController.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(next));
          },
        );

        return GoogleMap(
          markers: markers,
          initialCameraPosition: cameraPosition,
          mapType: MapType.hybrid,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            if (!_mapController.isCompleted) {
              _mapController.complete(controller);
            }
          },
          onTap: (argument) async {
            await ref
                .read(markersProvider.notifier)
                .setMarker(argument.latitude, argument.longitude);
          },
        );
      },
    );
  }
}
