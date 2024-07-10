import 'package:flutter/material.dart';
import 'package:skar_admin/pages/dimension_groups_with_dimensions/dimension_groups_with_dimensions.dart';

class SelectProductDimension extends StatelessWidget {
  const SelectProductDimension({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Harydyn bu renkinin olceglerini saylan: '),
        DimensionGroupsWithDimensions(),
      ],
    );
  }
}
