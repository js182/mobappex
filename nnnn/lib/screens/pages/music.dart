import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[100],
      child: new Center(
        child: Text('Index 3: '+AppLocalization.of(context).music),
      ),
    );
  }
}