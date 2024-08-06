import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductComplaintData extends StatelessWidget {
  const ProductComplaintData({super.key, required this.complaintProduct});

  final ComplaintProduct complaintProduct;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer(
          builder: (context, ref, child) {
            bool isTM = ref.watch(langProvider) == 'tr';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  isTM ? complaintProduct.nameTM : complaintProduct.nameRU,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${lang.countComplaints}: ${complaintProduct.complaintCount}',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
