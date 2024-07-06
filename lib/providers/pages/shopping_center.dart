import 'package:flutter_riverpod/flutter_riverpod.dart';

var shoppingCenterSearchProvider =
    StateProvider.autoDispose<String>((ref) => '');
var hasShoppingCenterProvider = StateProvider.autoDispose<bool>((ref) => true);
var selectedShoppincCenterProvider =
    StateProvider.autoDispose<String>((ref) => '');
