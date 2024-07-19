import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skar_admin/database/config.dart';
import 'package:skar_admin/helpers/map.dart';
import 'package:skar_admin/pages/start.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';
import 'package:skar_admin/styles/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance(); // shared preferences
  await SystemChrome.setPreferredOrientations([
    // APP ONLY DISPLAY PORTRAIT
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await createDB(); // create database
  await dotenv.load(fileName: ".env"); // LOAD .ENV FILE

  // asakdaky kot google map ucin
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    await initializeMapRenderer();
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      locale: const Locale('tr'),
    );
  }
}
