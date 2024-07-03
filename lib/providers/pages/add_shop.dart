import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hasShippingProvider = StateProvider<bool>((ref) => true);
final loadCreateShopProvider = StateProvider.autoDispose<bool>((ref) => false);
final shopImageProvider = StateProvider.autoDispose<File?>((ref) => null);
final shopImagePathProvider = StateProvider<String>((ref) => '');
