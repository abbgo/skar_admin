import 'package:flutter_riverpod/flutter_riverpod.dart';

var hasShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
var hasDeletedShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
final loadDeleteShopProvider = StateProvider.autoDispose<bool>((ref) => false);
var loadShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
