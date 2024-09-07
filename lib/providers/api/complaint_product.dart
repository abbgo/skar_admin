import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/models/complaint.dart';
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

      ResultComplaintProduct resultComplaintProduct =
          await ref.read(complaintProductApiProvider).fetchComplaintProducts(
                accessToken: accessToken,
                page: arg.page!,
                shopOwnerID: shopOwner.id,
              );

      await wrongToken(resultComplaintProduct.error, ref, arg.context);

      if (resultComplaintProduct.complaintProducts != null) {
        ref.read(hasComplaintProductsProvider.notifier).state =
            resultComplaintProduct.complaintProducts!.isNotEmpty;
      }

      result = resultComplaintProduct;
    } catch (e) {
      result = ResultComplaintProduct(error: e.toString());
    }

    ref.read(loadComplaintProductsProvider.notifier).state = false;
    return result;
  },
);

var fetchfetchProductComplaintsProvider =
    FutureProvider.autoDispose.family<ResultComplaint, ComplaintParams>(
  (ref, arg) async {
    ResultComplaint result = ResultComplaint.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);

      ResultComplaint resultComplaint =
          await ref.read(complaintProductApiProvider).fetchProductComplaints(
                accessToken: accessToken,
                page: arg.page!,
                productID: arg.productID!,
              );

      await wrongToken(resultComplaint.error, ref, arg.context);

      result = resultComplaint;
    } catch (e) {
      result = ResultComplaint(error: e.toString());
    }
    return result;
  },
);
