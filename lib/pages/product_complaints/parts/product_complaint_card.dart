import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class ProductComplaintCard extends ConsumerWidget {
  const ProductComplaintCard({super.key, required this.complaintProduct});

  final ComplaintProduct complaintProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTM = ref.watch(langProvider) == 'tr';

    return Card(
      child: ListTile(
        title: Text(isTM ? complaintProduct.nameTM : complaintProduct.nameRU),
      ),
    );
  }
}
