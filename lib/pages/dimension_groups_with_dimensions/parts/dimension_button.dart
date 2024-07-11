import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/dimension.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/styles/colors.dart';

class DimensionButton extends ConsumerWidget {
  const DimensionButton(
      {super.key, required this.d, required this.forOnlyShow});

  final Dimension d;
  final bool forOnlyShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Dimension> selectedDimensions = [];
    if (!forOnlyShow) {
      selectedDimensions = ref.watch(selectedDimensionsProvider);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: elevatedButtonColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: forOnlyShow
              ? null
              : !selectedDimensions.contains(d)
                  ? Colors.white
                  : null,
        ),
        onPressed: forOnlyShow
            ? () {}
            : () async {
                if (selectedDimensions.contains(d)) {
                  await ref
                      .read(selectedDimensionsProvider.notifier)
                      .removeDimension(d);
                  return;
                }

                await ref
                    .read(selectedDimensionsProvider.notifier)
                    .addDimension(d);
              },
        child: Text(
          d.dimension,
          style: TextStyle(
            color: forOnlyShow
                ? null
                : !selectedDimensions.contains(d)
                    ? elevatedButtonColor
                    : null,
          ),
        ),
      ),
    );
  }
}
