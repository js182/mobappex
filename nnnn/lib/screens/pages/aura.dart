import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class Aura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: Text('Index 1: '+AppLocalization.of(context).aura),
      )
    );
  }
}
