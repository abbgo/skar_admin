import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hasShippingProvider = StateProvider.autoDispose<bool>((ref) => true);
final shopImageProvider = StateProvider.autoDispose<File?>((ref) => null);
final shopImagePathProvider = StateProvider<String>((ref) => '');
