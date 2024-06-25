import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/functions.dart';
import 'package:skar_admin/providers/pages/map.dart';
import 'package:skar_admin/pages/map/parts/location_permission.dart'
    as permission;
import 'package:skar_admin/pages/map/parts/map.dart' as map;

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    permissionHandler(ref);
    bool hasPermission = ref.watch(locationPermissionProvider);
    bool isLoading = ref.watch(loadProvider);

    return Scaffold(
      body: isLoading
          ? Center(
              child: Image.asset('assets/animated_icons/animated_map.gif'),
            )
          : hasPermission
              ? const map.Map()
              : permission.LocationPermission(ref: ref),
    );
  }
}
