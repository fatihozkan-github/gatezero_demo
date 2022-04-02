import 'package:easy_localization/easy_localization.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get_it/get_it.dart';
import 'core/services/service_localization.dart';
import 'package:gatezero_demo/initials.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'core/UI/shared/themes.dart';
import 'core/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Initials.setupInjector();
  runApp(
    EasyLocalization(
      path: LocalizationService.translationsPath,
      fallbackLocale: LocalizationService.supportedLocales[1],
      supportedLocales: [LocalizationService.supportedLocales[1]],
      child: GateZero(),
    ),
  );
}

class GateZero extends StatelessWidget {
  // final appRouter = GetIt.I.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Initials.providers,
      child: AdaptiveTheme(
        light: UIThemes.lightTheme,
        dark: UIThemes.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: Initials.appTitle,
            theme: theme,
            darkTheme: darkTheme,
            routerDelegate: AutoRouterDelegate(GetIt.I<AppRouter>()),
            routeInformationParser: GetIt.I<AppRouter>().defaultRouteParser(),
            locale: LocalizationService.supportedLocales[1],
            supportedLocales: [LocalizationService.supportedLocales[1]],
            localizationsDelegates: context.localizationDelegates,
          );
        },
      ),
    );
  }
}
