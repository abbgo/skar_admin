import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/category.dart';
import 'package:skar_admin/pages/categories/parts/categories_list.dart';
import 'package:skar_admin/providers/api/category.dart';

class ResultCategories extends ConsumerWidget {
  const ResultCategories({super.key, required this.childCategories});

  final List<Category> childCategories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ResultCategory> resultCategories =
        ref.watch(fetchCategoriesProvider);

    return childCategories.isEmpty
        ? Text('result categories')
        // ? resultCategories.when(
        //     skipLoadingOnRefresh: true,
        //     skipLoadingOnReload: true,
        //     skipError: true,
        //     data: (response) {
        //       if (response.error != '') {
        //         return null;
        //       }

        //       List<Category> categories = response.categories!;
        //       return CategoriesList(categories: categories);
        //     },
        //     error: (error, stackTrace) => errorMethod(error),
        //     loading: () => null,
        //   )
        : CategoriesList(categories: childCategories);
  }
}
