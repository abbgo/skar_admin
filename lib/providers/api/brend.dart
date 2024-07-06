import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/services/api/brend.dart';

final brendApiProvider = Provider<BrendApiService>((ref) => BrendApiService());

var fetchBrendsProvider =
    FutureProvider.autoDispose.family<ResultBrend, BrendParams>(
  (ref, arg) async {},
);
