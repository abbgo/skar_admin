import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/categories_list.dart';
import 'package:skar_admin/pages/categories/parts/category_list_tile.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/providers/api/category.dart';
import 'package:skar_admin/providers/pages/category.dart';
import 'package:skar_admin/services/api/brend.dart';

class ResultCategories extends ConsumerWidget {
  const ResultCategories({super.key, required this.childCategories});

  final List<Category> childCategories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasCategories = ref.watch(hasCategoriesProvider);
    List<Category> selectedCategories = ref.read(selectedCategoriesProvider);

    return !hasCategories
        ? const NoResult()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: childCategories.isEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final page = index ~/ pageSize + 1;
                      final indexInPage = index % pageSize;

                      DefaultParams categoryParams =
                          DefaultParams(page: page, isDeleted: false);
                      AsyncValue<ResultCategory> resultCategories =
                          ref.watch(fetchCategoriesProvider(categoryParams));

                      return resultCategories.when(
                        skipLoadingOnRefresh: true,
                        skipLoadingOnReload: true,
                        skipError: true,
                        data: (response) {
                          if (response.error != '' ||
                              response.categories == null) {
                            return null;
                          }
                          if (indexInPage >= response.categories!.length) {
                            return null;
                          }

                          Category category = response.categories![indexInPage];
                          for (var sc in selectedCategories) {
                            if (sc.id == category.id) {
                              category.isChecked = true;
                            }
                          }

                          return CategoryListTile(category: category);
                        },
                        error: (error, stackTrace) => errorMethod(error),
                        loading: () => null,
                      );
                    },
                  )
                : CategoriesList(categories: childCategories),
          );
  }
}
