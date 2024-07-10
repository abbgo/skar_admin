import 'package:flutter_riverpod/flutter_riverpod.dart';

var loadSendImageProvider = StateProvider.autoDispose<bool>((ref) => false);
var removeBackgroundProvider = StateProvider.autoDispose<bool>((ref) => false);
