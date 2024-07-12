import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/brend.dart';

var brendSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasBrendProvider = StateProvider.autoDispose<bool>((ref) => true);
var selectedBrendProvider = StateProvider<Brend>((ref) => Brend.defaultBrend());
