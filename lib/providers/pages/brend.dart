import 'package:flutter_riverpod/flutter_riverpod.dart';

var brendSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasBrendProvider = StateProvider.autoDispose<bool>((ref) => true);
var selectedBrendProvider = StateProvider.autoDispose<String>((ref) => '');
