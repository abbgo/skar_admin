import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/functions/validation.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/providers/pages/brend.dart';
import 'package:skar_admin/services/api/brend.dart';

final brendApiProvider = Provider<BrendApiService>((ref) => BrendApiService());

var fetchBrendsProvider =
    FutureProvider.autoDispose.family<ResultBrend, DefaultParams>(
  (ref, arg) async {
    ResultBrend result = ResultBrend.defaultResult();

    try {
      String search = ref.watch(brendSearchProvider);
      String accessToken = await ref.read(accessTokenProvider);
      ResultBrend resultBrend = await ref.read(brendApiProvider).fetchBrends(
            accessToken: accessToken,
            page: arg.page!,
            isDeleted: arg.isDeleted!,
            search: search,
          );

      await wrongToken(resultBrend.error, ref, arg.context);

      if (resultBrend.brends != null) {
        ref.read(hasBrendProvider.notifier).state =
            resultBrend.brends!.isNotEmpty;
      }

      result = resultBrend;
    } catch (e) {
      result = ResultBrend(error: e.toString());
    }
    return result;
  },
);
