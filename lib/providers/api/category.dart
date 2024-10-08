import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/category.dart';
import 'package:skar_admin/services/api/brend.dart';
import 'package:skar_admin/services/api/category.dart';

final categoryApiProvider =
    Provider<CategoryApiService>((ref) => CategoryApiService());

var fetchCategoriesProvider =
    FutureProvider.autoDispose.family<ResultCategory, DefaultParams>(
  (ref, arg) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      String search = ref.watch(categorySearchProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      ResultCategory resultCategory =
          await ref.read(categoryApiProvider).fetchCategories(
                search,
                arg.page!,
                isTM ? 'tm' : 'ru',
              );

      if (resultCategory.categories != null) {
        ref.read(hasCategoriesProvider.notifier).state =
            resultCategory.categories!.isNotEmpty;
      }

      result = resultCategory;
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }
    return result;
  },
);
