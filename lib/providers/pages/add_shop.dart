import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final hasDeliveryProvider = StateProvider.autoDispose<bool>((ref) => true);
final shopImageProvider = StateProvider.autoDispose<File?>((ref) => null);
