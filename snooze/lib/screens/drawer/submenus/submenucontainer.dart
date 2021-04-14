import 'package:flutter/material.dart';

class SubMenuContainer extends StatelessWidget {
  final String title;
  final Widget content;

  SubMenuContainer(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: this.content,
    );
  }
}
