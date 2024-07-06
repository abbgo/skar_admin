import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/services/api/category.dart';

final categoryApiProvider =
    Provider<CategoryApiService>((ref) => CategoryApiService());

var fetchCategoriesProvider = FutureProvider.autoDispose<ResultCategory>(
  (ref) async {
    ResultCategory result = ResultCategory.defaultResult();

    try {
      ResultCategory resultBrend =
          await ref.read(categoryApiProvider).fetchCategories();

      result = resultBrend;
    } catch (e) {
      result = ResultCategory(error: e.toString());
    }
    return result;
  },
);
