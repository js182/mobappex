import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: [
        new ListTile(
          title: new Text(AppLocalization.of(context).language),
          leading: new Icon(Icons.language),
          onTap: () {
            Navigator.pushNamed(context, '/settings_lang');
          },
        ),
        new ListTile(
          title: new Text(AppLocalization.of(context).theme),
          leading: new Icon(Icons.color_lens),
          onTap: () {
            Navigator.pushNamed(context, '/settings_theme');
          },
        ),
      ],
    );
  }
}

