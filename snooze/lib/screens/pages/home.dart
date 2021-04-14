import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../terminal.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Index 0: '+AppLocalization.of(context).home,
          ),
        ],
      ),
    );
  }
}
