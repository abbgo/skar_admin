import 'package:flutter_riverpod/flutter_riverpod.dart';

var selectedShoppincCenterProvider =
    StateProvider.autoDispose<String>((ref) => '');
