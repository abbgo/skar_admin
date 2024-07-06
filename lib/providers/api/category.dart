import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/services/api/category.dart';

final categoryApiProvider =
    Provider<CategoryApiService>((ref) => CategoryApiService());
