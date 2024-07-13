import 'package:flutter/material.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/pages/dimension_groups_with_dimensions/parts/dimension_button.dart';

class SelectedDimensions extends StatelessWidget {
  const SelectedDimensions({super.key, required this.dimensions});

  final List<Dimension> dimensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
          mainAxisExtent: 40,
        ),
        itemCount: dimensions.length,
        itemBuilder: (context, index) =>
            DimensionButton(d: dimensions[index], forOnlyShow: true),
      ),
    );
  }
}
