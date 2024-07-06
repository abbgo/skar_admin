import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/services/api/brend.dart';

final brendApiProvider = Provider<BrendApiService>((ref) => BrendApiService());

var fetchBrendsProvider =
    FutureProvider.autoDispose.family<ResultBrend, BrendParams>(
  (ref, arg) async {
    ResultBrend result = ResultBrend.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultBrend resultBrend = await ref.read(brendApiProvider).fetchBrends(
            accessToken: accessToken,
            page: arg.page!,
            isDeleted: arg.isDeleted!,
            search: '',
          );

      if (resultBrend.error == 'auth error') {
        await ref.read(accessTokenProvider.notifier).update('');
      }
      result = resultBrend;
    } catch (e) {
      result = ResultBrend(error: e.toString());
    }
    return result;
  },
);
