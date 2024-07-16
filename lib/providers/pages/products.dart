import 'package:flutter_riverpod/flutter_riverpod.dart';

var hasProductsProvider = StateProvider.autoDispose<bool>((ref) => true);
var productSearchProvider = StateProvider.autoDispose<String>((ref) => '');
