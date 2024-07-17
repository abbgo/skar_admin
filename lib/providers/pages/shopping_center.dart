import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/shop.dart';

var shoppingCenterSearchProvider =
    StateProvider.autoDispose<String>((ref) => '');
var hasShoppingCenterProvider = StateProvider.autoDispose<bool>((ref) => true);
var selectedShoppincCenterProvider = StateProvider<Shop>(
  (ref) => Shop.defaultShop(),
);
