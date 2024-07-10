import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';

class DimensionButton extends ConsumerWidget {
  const DimensionButton({super.key, required this.d});

  final Dimension d;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {},
      child: Text(d.dimension),
    );
  }
}
