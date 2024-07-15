import 'package:flutter/material.dart';
import 'package:skar_admin/pages/dimension_groups_with_dimensions/dimension_groups_with_dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectProductDimension extends StatelessWidget {
  const SelectProductDimension({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppLocalizations.of(context)!.selectProductColorDimensions} * : ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const DimensionGroupsWithDimensions(),
      ],
    );
  }
}
