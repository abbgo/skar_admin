import 'package:flutter_riverpod/flutter_riverpod.dart';

final hasShippingProvider = StateProvider<bool>((ref) => true);
final loadCreateShopProvider = StateProvider.autoDispose<bool>((ref) => false);
final shopImagePathProvider = StateProvider<String>((ref) => '');
final atHomeShopProvider = StateProvider.autoDispose<bool>((ref) => false);
