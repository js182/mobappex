import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class StartTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //TODO: tutorial popup
      appBar: new AppBar(
        title: new Text(AppLocalization.of(context).tutorial),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: new Center(
        child: new Text('TODO: display slide tutorial with dots as locationindicator at bottom'),
      ),
    );
  }
}
