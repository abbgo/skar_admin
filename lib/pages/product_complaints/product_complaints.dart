import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/pages/product_complaints/parts/product_complaint_card.dart';
import 'package:skar_admin/providers/api/complaint_product.dart';
import 'package:skar_admin/providers/pages/complaint_product.dart';
import 'package:skar_admin/services/api/brend.dart';

class ProductComplaintsPage extends ConsumerWidget {
  const ProductComplaintsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    bool hasComplaintProducts = ref.watch(hasComplaintProductsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(lang.productComplaints)),
      body: !hasComplaintProducts
          ? const NoResult()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;

                  DefaultParams params = DefaultParams(
                    page: page,
                    isDeleted: false,
                    context: context,
                  );

                  final AsyncValue<ResultComplaintProduct> cps =
                      ref.watch(fetchComplaintProductsProvider(params));

                  return cps.when(
                    skipLoadingOnRefresh: true,
                    skipLoadingOnReload: true,
                    skipError: true,
                    data: (response) {
                      if (response.error != '') {
                        return null;
                      }
                      if (indexInPage >= response.complaintProducts!.length) {
                        return null;
                      }
                      ComplaintProduct cp =
                          response.complaintProducts![indexInPage];

                      return ProductComplaintCard(complaintProduct: cp);
                    },
                    error: (error, stackTrace) => errorMethod(error),
                    loading: () => null,
                  );
                },
              ),
            ),
    );
  }
}
