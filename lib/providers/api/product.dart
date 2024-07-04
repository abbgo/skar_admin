import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/product.dart';

final productApiProvider =
    Provider<ProductApiService>((ref) => ProductApiService());

var fetchProductsProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultProduct resultProduct =
          await ref.read(productApiProvider).fetchProducts(
                accessToken: accessToken,
                page: arg.page!,
                isDeleted: arg.isDeleted!,
                search: '',
                shopID: arg.shopID!,
                lang: '',
              );

      if (resultProduct.error == 'auth error') {
        await ref.read(accessTokenProvider.notifier).update('');
      }

      result = resultProduct;
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }
    return result;
  },
);
