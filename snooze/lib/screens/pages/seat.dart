import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class Seat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: Text('Index 2: '+AppLocalization.of(context).seat),
      ),
    );
  }
}
