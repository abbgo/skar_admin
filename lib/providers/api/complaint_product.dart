import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/complaint_product.dart';
import 'package:skar_admin/services/api/complaint_product.dart';

final complaintProductApiProvider =
    Provider<ComplaintProductApiService>((ref) => ComplaintProductApiService());

var fetchComplaintProductsProvider = FutureProvider.autoDispose
    .family<ResultComplaintProduct, ComplaintProductParams>(
  (ref, arg) async {
    ResultComplaintProduct result = ResultComplaintProduct.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultComplaintProduct resultBrend =
          await ref.read(complaintProductApiProvider).fetchComplaintProducts(
                accessToken: accessToken,
                page: arg.page!,
                shopOwnerID: arg.shopOwnerID!,
              );

      await wrongToken(resultBrend.error, ref, arg.context);

      if (resultBrend.complaintProducts != null) {
        ref.read(hasComplaintProductsProvider.notifier).state =
            resultBrend.complaintProducts!.isNotEmpty;
      }

      result = resultBrend;
    } catch (e) {
      result = ResultComplaintProduct(error: e.toString());
    }
    return result;
  },
);
