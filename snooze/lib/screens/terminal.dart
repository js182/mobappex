import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'pages/import_all.dart';
import 'drawer/sidemenu.dart';

class Terminal extends StatefulWidget {
  Terminal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  int _pageIndex = 0;

  //coloring of bottomappbar
  int _destinationDistance = 0;

  Widget _drawer = new SideMenuDrawer();

  PageController _pageController = PageController(initialPage: 2);

  //pagecontents
  static List<Widget> _pageOptions = <Widget>[Home(), Aura(), Seat(), Music()];

  //style of bottomAppBar
  TextStyle _bottomAppBarStyle = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15.0,
  );
  double _bottomAppBarButtonSize = 35.0;
  double _bottomAppBarButtonSizeSelected = 55.0;

  //stops the chair movement when emergency button is clicked
  void _stopPress() {
    setState(() {
      print("STOP ALL IMMEDIATELYX!!1");
      //TODO: STOP ALL  (notify)
    });
  }

  //navigates to requested page
  void _bottomAppBarButtonPressed(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    });
  }

  void _rebuild() {
    setState(() {});
  }

  int _distAmount(int start, int end) {
    if (start - end >= 0) {
      return start - end;
    }
    return end - start;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int) {
              _pageIndex = int;
              if (_destinationDistance > 1) {
                _destinationDistance--;
              } else {
                _rebuild();
              }
            },
            children: _pageOptions,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            physics: BouncingScrollPhysics(),
          ),
          //TODO: animateTo und animateFadeOut
          // switch(_pageIndex){
          //   case 0: new Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           new Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               new RaisedButton(
          //                 color: Colors.indigo[200],
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(30.0),
          //                 ),
          //                 child: new Text(
          //                   AppLocalization.of(context).continuebutton,
          //                   style: TextStyle(
          //                     fontSize: 30.0,
          //                   ),
          //                 ),
          //                 onPressed: () => _bottomAppBarButtonPressed(
          //                     _pageIndex + 1 <= 3 ? _pageIndex + 1 : 3),
          //                 padding: EdgeInsets.all(10.0),
          //               ),
          //               SizedBox(
          //                 width: 10.0,
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10.0,
          //           ),
          //         ],
          //       ),
          //       break;
          //   case 1: new Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           new Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               new RaisedButton(
          //                 color: Colors.indigo[200],
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(30.0),
          //                 ),
          //                 child: new Text(
          //                   AppLocalization.of(context).continuebutton,
          //                   style: TextStyle(
          //                     fontSize: 30.0,
          //                   ),
          //                 ),
          //                 onPressed: () => _bottomAppBarButtonPressed(
          //                     _pageIndex + 1 <= 3 ? _pageIndex + 1 : 3),
          //                 padding: EdgeInsets.all(10.0),
          //               ),
          //               SizedBox(
          //                 width: 10.0,
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10.0,
          //           ),
          //         ],
          //       ),
          //       break;
          //   case 2: new Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           new Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               new RaisedButton(
          //                 color: Colors.indigo[200],
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(30.0),
          //                 ),
          //                 child: new Text(
          //                   AppLocalization.of(context).continuebutton,
          //                   style: TextStyle(
          //                     fontSize: 30.0,
          //                   ),
          //                 ),
          //                 onPressed: () => _bottomAppBarButtonPressed(
          //                     _pageIndex + 1 <= 3 ? _pageIndex + 1 : 3),
          //                 padding: EdgeInsets.all(10.0),
          //               ),
          //               SizedBox(
          //                 width: 10.0,
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10.0,
          //           ),
          //         ],
          //       ),
          //       break;
          //   case 3: new Container(),
          //       break;
          // },
          _pageIndex == 0 
                ? new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new RaisedButton(
                          color: Colors.indigo[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: new Text(
                            AppLocalization.of(context).startsnoozing,
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          onPressed: () => _bottomAppBarButtonPressed(
                              _pageIndex + 1 <= 3 ? _pageIndex + 1 : 3),
                          padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
                        ),
                        // SizedBox(
                        //   width: 10.0,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                  ],
                )
              : _pageIndex == 1 || _pageIndex == 2
                 ? new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            new RaisedButton(
                              color: Colors.indigo[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: new Text(
                                AppLocalization.of(context).continuebutton,
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              onPressed: () => _bottomAppBarButtonPressed(
                                  _pageIndex + 1 <= 3 ? _pageIndex + 1 : 3),
                              padding: EdgeInsets.all(10.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )
                  : new Container(),
        ],
      ),
      endDrawer: _drawer,
      floatingActionButton: Container(
        width: 130.0,
        height: 110.0,
        child: ClipOval(
          child: RawMaterialButton(
            fillColor: Colors.red[600], //theme nicht beachten
            child: const Text(
              'STOP', //lang nicht beachten
              textScaleFactor: 2.5,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            onPressed: _stopPress,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6.0,
        color: Colors.blue[400], //TODO: theme einbauen
        child: Container(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: _pageIndex == 0
                    ? <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSizeSelected,
                          icon: Icon(Icons.home),
                          color: Colors.amber[700], //TODO: theme einbauen
                          onPressed: () {},
                        ),
                      ]
                    : <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSize,
                          icon: Icon(Icons.home),
                          color: _pageIndex == 0
                              ? Colors.amber[700]
                              : Colors.black,
                          onPressed: () {
                            _destinationDistance = _distAmount(0, _pageIndex);
                            _bottomAppBarButtonPressed(0);
                          },
                        ),
                        Text(
                          AppLocalization.of(context).home,
                          style: _bottomAppBarStyle,
                        )
                      ],
              ),
              Column(
                children: _pageIndex == 1
                    ? <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSizeSelected,
                          icon: Icon(Icons.lightbulb_outline),
                          color: Colors.amber[700],
                          onPressed: () {},
                        ),
                      ]
                    : <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSize,
                          icon: Icon(Icons.lightbulb_outline),
                          color: _pageIndex == 1
                              ? Colors.amber[700]
                              : Colors.black,
                          onPressed: () {
                            _destinationDistance = _distAmount(1, _pageIndex);
                            _bottomAppBarButtonPressed(1);
                          },
                        ),
                        Text(
                          AppLocalization.of(context).aura,
                          style: _bottomAppBarStyle,
                        )
                      ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
              ),
              Column(
                children: _pageIndex == 2
                    ? <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSizeSelected,
                          icon: Icon(Icons.airline_seat_recline_normal),
                          color: Colors.amber[700],
                          onPressed: () {},
                        ),
                      ]
                    : <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSize,
                          icon: Icon(Icons.airline_seat_recline_normal),
                          color: _pageIndex == 2
                              ? Colors.amber[700]
                              : Colors.black,
                          onPressed: () {
                            _destinationDistance = _distAmount(2, _pageIndex);
                            _bottomAppBarButtonPressed(2);
                          },
                        ),
                        Text(
                          AppLocalization.of(context).seat,
                          style: _bottomAppBarStyle,
                        )
                      ],
              ),
              Column(
                children: _pageIndex == 3
                    ? <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSizeSelected,
                          icon: Icon(Icons.music_note),
                          color: Colors.amber[700],
                          onPressed: () {},
                        ),
                      ]
                    : <Widget>[
                        IconButton(
                          iconSize: _bottomAppBarButtonSize,
                          icon: Icon(Icons.music_note),
                          color: _pageIndex == 3
                              ? Colors.amber[700]
                              : Colors.black,
                          onPressed: () {
                            _destinationDistance = _distAmount(3, _pageIndex);
                            _bottomAppBarButtonPressed(3);
                          },
                        ),
                        Text(
                          AppLocalization.of(context).music,
                          style: _bottomAppBarStyle,
                        )
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
