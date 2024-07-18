import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/models/dimension_group.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/brend.dart';
import 'package:skar_admin/services/api/dimension_group.dart';

final dimensionGroupApiProvider =
    Provider<DimensionGroupApiService>((ref) => DimensionGroupApiService());

var fetchDimensionGroupsWithDimensionsProvider =
    FutureProvider.autoDispose.family<ResultDimensionGroup, DefaultParams>(
  (ref, arg) async {
    ResultDimensionGroup result = ResultDimensionGroup.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultDimensionGroup resultDimensionGroup = await ref
          .read(dimensionGroupApiProvider)
          .fetchDimensionGroupsWithDimensions(
            accessToken: accessToken,
            page: arg.page!,
            isDeleted: arg.isDeleted!,
          );

      await wrongToken(resultDimensionGroup.error, ref, arg.context);

      result = resultDimensionGroup;
    } catch (e) {
      result = ResultDimensionGroup(error: e.toString());
    }
    return result;
  },
);
