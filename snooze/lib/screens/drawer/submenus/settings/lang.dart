import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

enum Language {de, en, es}

class SettingsLangPage extends StatefulWidget {
  SettingsLangPage({Key key}) : super(key: key);

  @override
  _SettingsLangPageState createState() => _SettingsLangPageState();
}

class _SettingsLangPageState extends State<SettingsLangPage> {

  Language _language = Language.de;

  @override
  void initState(){

    //TODO: load sharedPreferences language
    
    //_onSelect(Language.en);

    // switch()
    // print("langues= "+AppLocalization.toString());

    super.initState();
  }
  
  void _onSelect(Language value){
    setState(() {
      this._language = value;
      switch(_language.toString().substring(9)){
        case 'en':  AppLocalization.load(new Locale('en', 'US'));
                    print("selcect: en");
                    break;
        case 'de':  AppLocalization.load(new Locale('de', 'DE'));
                    print("selcect: de");
                    break;
        case 'es':  AppLocalization.load(new Locale('es', 'ES'));
                    print("selcect: es");
                    break;
      }
      // TODO: update language inapp + sharedPreferences
    });
  }

  @override
  Widget build(BuildContext context){
    return new ListView(
      children: [
        new RadioListTile <Language>(
          title: const Text('Deutsch'),
          value: Language.de,
          groupValue: _language,
          onChanged: _onSelect,
        ),
        new RadioListTile <Language>(
          title: const Text('English'),
          value: Language.en,
          groupValue: _language,
          onChanged: _onSelect,
        ),
        new RadioListTile <Language>(
          title: const Text('Español'),
          value: Language.es,
          groupValue: _language,
          onChanged: _onSelect,
        ),
      ],
    );
  }
}