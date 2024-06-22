import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final accessTokenProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "access_token",
  defaultValue: '',
);

final refreshTokenProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "refresh_token",
  defaultValue: '',
);

var selectedBottomIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
