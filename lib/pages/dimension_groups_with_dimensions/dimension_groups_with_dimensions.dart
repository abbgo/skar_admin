import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/dimension_group.dart';
import 'package:skar_admin/pages/dimension_groups_with_dimensions/parts/dimension_group_card.dart';
import 'package:skar_admin/providers/api/dimension_group.dart';
import 'package:skar_admin/services/api/brend.dart';

class DimensionGroupsWithDimensions extends ConsumerWidget {
  const DimensionGroupsWithDimensions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;

        DefaultParams params = DefaultParams(page: page, isDeleted: false);
        final AsyncValue<ResultDimensionGroup> dimensionGroups =
            ref.watch(fetchDimensionGroupsWithDimensionsProvider(params));

        return dimensionGroups.when(
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          skipError: true,
          data: (response) {
            if (response.error != '') {
              return null;
            }
            if (indexInPage >= response.dimensionGroups!.length) {
              return null;
            }

            DimensionGroup dimensionGroup =
                response.dimensionGroups![indexInPage];

            return DimensionGroupCard(dimensionGroup: dimensionGroup);
          },
          error: (error, stackTrace) => errorMethod(error),
          loading: () => null,
        );
      },
    );
  }
}
