import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/helpers/methods/snackbars.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/providers/internet_connection.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/brend.dart';
import 'package:skar_admin/providers/pages/category.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/services/api/product.dart';

final productApiProvider =
    Provider<ProductApiService>((ref) => ProductApiService());

var fetchCountOfProductsProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      String search = ref.watch(productSearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      ResultProduct resultProduct =
          await ref.read(productApiProvider).fetchCountOfProducts(
                accessToken: accessToken,
                isDeleted: arg.isDeleted!,
                search: search,
                shopID: arg.shopID!,
                lang: isTM ? 'tm' : 'ru',
              );

      await wrongToken(resultProduct.error, ref, arg.context);

      result = resultProduct;
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }
    return result;
  },
);

var fetchProductsProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      String search = ref.watch(productSearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      ResultProduct resultProduct =
          await ref.read(productApiProvider).fetchProducts(
                accessToken: accessToken,
                page: arg.page!,
                isDeleted: arg.isDeleted!,
                search: search,
                shopID: arg.shopID!,
                lang: isTM ? 'tm' : 'ru',
              );

      await wrongToken(resultProduct.error, ref, arg.context);

      if (resultProduct.products != null) {
        ref.read(hasProductsProvider.notifier).state =
            resultProduct.products!.isNotEmpty;
      }

      result = resultProduct;
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }
    return result;
  },
);

var updateProductProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      bool hasInternert =
          await ref.read(checkInternetConnProvider(arg.context!).future);

      if (hasInternert) {
        String accessToken = await ref.read(accessTokenProvider);
        ResultProduct resultProduct = await ref
            .read(productApiProvider)
            .updateProduct(accessToken: accessToken, product: arg.product!);

        await wrongToken(resultProduct.error, ref, arg.context);

        if (resultProduct.error == 'some error') {
          if (arg.context!.mounted) showSomeErr(arg.context!);
        }

        result = resultProduct;
      }
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }

    return result;
  },
);

var createProductProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      bool hasInternert =
          await ref.read(checkInternetConnProvider(arg.context!).future);

      if (hasInternert) {
        String accessToken = await ref.read(accessTokenProvider);
        ResultProduct resultProduct = await ref
            .read(productApiProvider)
            .createProduct(accessToken: accessToken, product: arg.product!);

        await wrongToken(resultProduct.error, ref, arg.context);

        if (resultProduct.error == 'some error') {
          if (arg.context!.mounted) showSomeErr(arg.context!);
        }

        result = resultProduct;
      }
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }

    return result;
  },
);

var fetchProductProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();
    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultProduct resultProduct = await ref
          .read(productApiProvider)
          .fetchProduct(accessToken: accessToken, productID: arg.productID!);

      await wrongToken(resultProduct.error, ref, arg.context);

      if (resultProduct.product != null) {
        ref.read(visibleProductProvider.notifier).state =
            resultProduct.product!.isVisible!;

        if (resultProduct.product!.brend != null) {
          ref.read(selectedBrendProvider.notifier).state =
              resultProduct.product!.brend!;
        }

        await ref
            .read(selectedCategoriesProvider.notifier)
            .setCategories(resultProduct.product!.categories!);

        await ref
            .read(productColorsProvider.notifier)
            .setProductColors(resultProduct.product!.productColors!);
      }

      result = resultProduct;
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }
    return result;
  },
);
