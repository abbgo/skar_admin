import 'package:flutter/material.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/models/dimension_group.dart';
import 'package:skar_admin/pages/dimension_groups_with_dimensions/parts/dimension_button.dart';
import 'package:skar_admin/styles/colors.dart';

class DimensionGroupCard extends StatelessWidget {
  const DimensionGroupCard({super.key, required this.dimensionGroup});

  final DimensionGroup dimensionGroup;

  @override
  Widget build(BuildContext context) {
    List<Dimension> dimensions = dimensionGroup.dimensions!;

    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ExpansionTile(
          collapsedBackgroundColor: elevatedButtonColor,
          collapsedTextColor: Colors.white,
          title: Text(dimensionGroup.name),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                    DimensionButton(d: dimensions[index], forOnlyShow: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
