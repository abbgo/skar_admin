import 'package:flutter/material.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/methods/dialogs.dart';
import 'package:skar_admin/models/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/styles/colors.dart';

class ProductListTileStatuses extends StatelessWidget {
  const ProductListTileStatuses({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    String createdStatus = '';
    Color statusColor = Colors.green;

    switch (product.createdStatus) {
      case CreatedStatuses.wait:
        createdStatus = lang.inReview;
        statusColor = elevatedButtonColor;
        break;
      case CreatedStatuses.rejected:
        createdStatus = lang.rejected;
        statusColor = Colors.red;
        break;
      case CreatedStatuses.success:
        createdStatus = lang.active;
        statusColor = Colors.green;
        break;
      default:
        createdStatus = lang.active;
        statusColor = Colors.green;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: product.rejectedReason != ''
              ? () => showRejectedInfoDialog(
                    context,
                    product.rejectedReason!,
                  )
              : null,
          child: Text(
            createdStatus,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: 2),
        product.rejectedReason != ''
            ? GestureDetector(
                onTap: () => showRejectedInfoDialog(
                  context,
                  product.rejectedReason!,
                ),
                child: const Icon(
                  Icons.info,
                  size: 16,
                  color: Colors.red,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
