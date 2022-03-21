import 'package:gatezero_demo/screens/bottom_navigation/bottom_navigation.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gatezero_demo/initials.dart';
import 'package:gatezero_demo/screens/intro/screen_landing.dart';
import 'package:gatezero_demo/screens/intro/screen_welcome.dart';
import 'package:gatezero_demo/services/service_hive.dart';
import 'package:gatezero_demo/services/service_localization.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'UI/design_materials/DM_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  HiveService.hive = await Hive.openBox(Initials.appTitle);

  runApp(
    Phoenix(
      child: EasyLocalization(
        supportedLocales: [LocalizationService.supportedLocales.first],
        path: LocalizationService.translationsPath,
        fallbackLocale: LocalizationService.supportedLocales.first,
        child: GateZero(),
      ),
    ),
  );
}

class GateZero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Initials.providers,
      child: AdaptiveTheme(
        light: UIThemes.lightTheme,
        dark: UIThemes.darkTheme,
        initial: HiveService.getThemeInfo() ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Initials.appTitle,
            theme: theme,
            darkTheme: darkTheme,
            routes: Initials.routes,
            locale: LocalizationService.supportedLocales.first,
            supportedLocales: [LocalizationService.supportedLocales.first],
            localizationsDelegates: context.localizationDelegates,
            home: false
                // HiveService.getIsFirstTimerInfo()
                ? LandingScreen()
                : HiveService.getLoginInfo()
                    ? BottomNavigation()
                    : WelcomeScreen(),
          );
        },
      ),
    );
  }
}
// static const platform = MethodChannel('samples.flutter.dev/battery');
//
// Future<void> _getBatteryLevel() async {
//   String batteryLevel;
//   try {
//     final int result = await platform.invokeMethod('helloFromNativeCode');
//     batteryLevel = 'Battery level at $result % .';
//   } on PlatformException catch (e) {
//     batteryLevel = "Failed to get battery level: '${e.message}'.";
//   }
// }
