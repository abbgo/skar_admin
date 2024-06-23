import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());
