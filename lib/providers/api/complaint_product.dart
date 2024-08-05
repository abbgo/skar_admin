import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/models/complaint_product.dart';
import 'package:skar_admin/models/shop_owner.dart';
import 'package:skar_admin/providers/database/shop_owner.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/complaint_product.dart';
import 'package:skar_admin/services/api/brend.dart';
import 'package:skar_admin/services/api/complaint_product.dart';

final complaintProductApiProvider =
    Provider<ComplaintProductApiService>((ref) => ComplaintProductApiService());

var fetchComplaintProductsProvider =
    FutureProvider.autoDispose.family<ResultComplaintProduct, DefaultParams>(
  (ref, arg) async {
    ResultComplaintProduct result = ResultComplaintProduct.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ShopOwner shopOwner = await ref.read(getShopOwnerProvider.future);

      ResultComplaintProduct resultBrend =
          await ref.read(complaintProductApiProvider).fetchComplaintProducts(
                accessToken: accessToken,
                page: arg.page!,
                shopOwnerID: shopOwner.id,
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
