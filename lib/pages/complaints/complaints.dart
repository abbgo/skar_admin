import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/complaint.dart';
import 'package:skar_admin/providers/api/complaint_product.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/complaint_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ComplaintsPage extends ConsumerWidget {
  const ComplaintsPage({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool isTM = ref.watch(langProvider) == 'tr';

    return Scaffold(
      appBar: AppBar(title: Text(lang.productComplaints)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;

            ComplaintParams params = ComplaintParams(
              page: page,
              context: context,
              productID: productID,
            );

            final AsyncValue<ResultComplaint> cps =
                ref.watch(fetchfetchProductComplaintsProvider(params));

            return cps.when(
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
              skipError: true,
              data: (response) {
                if (response.error != '') {
                  return null;
                }
                if (indexInPage >= response.complaints!.length) {
                  return null;
                }

                Complaint cp = response.complaints![indexInPage];
                return ListTile(title: Text(isTM ? cp.textTM : cp.textRU));
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
