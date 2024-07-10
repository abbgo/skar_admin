import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/services/api/dimension_group.dart';

final dimensionGroupApiProvider =
    Provider<DimensionGroupApiService>((ref) => DimensionGroupApiService());
