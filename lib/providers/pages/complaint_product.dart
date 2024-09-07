import 'package:flutter_riverpod/flutter_riverpod.dart';

var hasComplaintProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final loadComplaintProductsProvider =
    StateProvider.autoDispose<bool>((ref) => true);
