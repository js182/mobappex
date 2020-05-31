import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/terminal.dart';
import 'screens/drawer/submenus/import_all.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:intl/intl.dart';

class App extends StatelessWidget {

  AppLocalizationDelegate _localeOverrideDelegate = AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    // set to fullscreen
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Snooze',
      theme: ThemeData(
        // pageTransitionsTheme: PageTransitionsTheme(builders: {
        //   TargetPlatform.android: SlideRightPageTransitionsBuilder(),
        // }),
        primarySwatch: Colors.blueGrey, //TODO: hier farbe einfügen

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Terminal(title: 'Snooze'),
      routes: {
        '/settings': (context) =>
            new SubMenuContainer(AppLocalization.of(context).settings, new SettingsPage()),
        '/settings_lang': (context) =>
            new SubMenuContainer(AppLocalization.of(context).language, new SettingsLangPage()),
        '/settings_theme': (context) =>
            new SubMenuContainer(AppLocalization.of(context).theme, new SettingsThemePage()),
        '/account_details': (context) =>
            new SubMenuContainer(AppLocalization.of(context).accountdetails, new AccountDetails()),
        '/start_tutorial': (context) => new StartTutorial(),
        '/support': (context) => new SubMenuContainer(AppLocalization.of(context).support, new Support()),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate
      ],
      supportedLocales: [
        const Locale('de', 'DE'),
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
    );
  }
}
