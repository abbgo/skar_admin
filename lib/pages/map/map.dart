import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/providers/pages/map.dart';
import 'package:skar_admin/pages/map/parts/location_permission.dart'
    as permission;

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasPermission = ref.watch(locationPermissionProvider);

    return Scaffold(
      body: hasPermission
          ? const Center(child: Text('Map Page'))
          : permission.LocationPermission(ref: ref),
    );
  }
}
