/*
 * https://flutter.dev/docs/development/accessibility-and-localization/internationalization
 *
 * flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/locale/app_localization.dart
 * flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading .\lib\l10n\intl_messages.arb .\lib\l10n\intl_en.arb .\lib\l10n\intl_de.arb .\lib\l10n\intl_es.arb .\lib\locale\app_localization.dart
 */

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import '../l10n/messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // list of locales
  String get heyWorld => Intl.message(
      'Hey World',
      name: 'heyWorld',
      desc: 'Simpel word for greeting ',
    );

  String get settings => Intl.message(
      'Settings',
      name: 'settings',
      desc: 'change preferences',
    );
  String get home => Intl.message(
      'Home',
      name: 'home',
      desc: 'home',
    );
  String get continuebutton => Intl.message(
      'Continue',
      name: 'continuebutton',
      desc: 'continuebutton',
    );
  String get aura => Intl.message(
      'Aura',
      name: 'aura',
      desc: 'aura',
    );
  String get seat => Intl.message(
      'Seat',
      name: 'seat',
      desc: 'seat',
    );
  String get music => Intl.message(
      'Music',
      name: 'music',
      desc: '',
  );
  String get accountdetails => Intl.message(
      'Account',
      name: 'accountdetails',
      desc: '',
    );
  String get support => Intl.message(
      'Support',
      name: 'support',
      desc: '',
    );
  String get starttutorial => Intl.message(
      'Start tutorial',
      name: 'starttutorial',
      desc: '',
  );
  String get theme => Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
    );
  String get language => Intl.message(
      'Language',
      name: 'language',
      desc: '',
    );
  String get tutorial => Intl.message(
      'Tutorial',
      name: 'tutorial',
      desc: '',
    );
  String get startsnoozing => Intl.message(
      'Snooze',
      name: 'startsnoozing',
      desc: '',
    );
    
  // String get xx => Intl.message(
  //     '',
  //     name: '',
  //     desc: '',
  //   );
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['en', 'de', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
