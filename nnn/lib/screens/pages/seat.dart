import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  @override
  _SeatState createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  double _backrest = 25;
  double _middle = 50;
  double _feetrest = 50;

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: new Column(
        children: <Widget> [
          new SizedBox(
            height: 10.0,
          ),
          // new Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new Expanded(
          //       child: new Container( 
          //         child: new Center(
          //           child: Text('Index 2: '+AppLocalization.of(context).seat),
          //         ),
          //       ),
          //     ),
          //     new Expanded(
          //       child: new Column(
          //         children: [
          //           new Row(
          //             mainAxisSize: MainAxisSize.max,
          //             children: [
          //               Semantics(
          //                 child: SizedBox(
          //                   width: 64,
          //                   height: 48,
          //                   child: TextField(
          //                     textAlign: TextAlign.center,
          //                     onSubmitted: (value) {
          //                       final newValue = double.tryParse(value);
          //                       if (newValue != null && newValue != _backrest) {
          //                         setState(() {
          //                           _backrest = newValue.clamp(0, 100) as double;
          //                         });
          //                       }
          //                     },
          //                     keyboardType: TextInputType.number,
          //                     controller: TextEditingController(
          //                       text: _backrest.toStringAsFixed(0),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               new Expanded(
          //                 child: new Slider(
          //                   value: _backrest,
          //                   min: 0,
          //                   max: 100,
          //                   onChanged: (value) {
          //                     setState(() {
          //                       _backrest = value;
          //                     });
          //                   },
          //                 ),
          //               ),
          //             ],
          //           ),
          //           new Row(
          //             mainAxisSize: MainAxisSize.max,
          //             children: [
          //               Semantics(
          //                 child: SizedBox(
          //                   width: 64,
          //                   height: 48,
          //                   child: TextField(
          //                     textAlign: TextAlign.center,
          //                     onSubmitted: (value) {
          //                       final newValue = double.tryParse(value);
          //                       if (newValue != null && newValue != _backrest) {
          //                         setState(() {
          //                           _backrest = newValue.clamp(0, 100) as double;
          //                         });
          //                       }
          //                     },
          //                     keyboardType: TextInputType.number,
          //                     controller: TextEditingController(
          //                       text: _backrest.toStringAsFixed(0),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           new Row(
          //             mainAxisSize: MainAxisSize.max,
          //             children: [
          //               Semantics(
          //                 child: SizedBox(
          //                   width: 64,
          //                   height: 48,
          //                   child: TextField(
          //                     textAlign: TextAlign.center,
          //                     onSubmitted: (value) {
          //                       final newValue = double.tryParse(value);
          //                       if (newValue != null && newValue != _backrest) {
          //                         setState(() {
          //                           _backrest = newValue.clamp(0, 100) as double;
          //                         });
          //                       }
          //                     },
          //                     keyboardType: TextInputType.number,
          //                     controller: TextEditingController(
          //                       text: _backrest.toStringAsFixed(0),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // new Row(
          //   children: [
          //     new 
          //   ],
          // )
        ],
      ),
    );
  }
}

                        // Semantics(
                        //   child: SizedBox(
                        //     width: 64,
                        //     height: 48,
                        //     child: TextField(
                        //       textAlign: TextAlign.center,
                        //       onSubmitted: (value) {
                        //         final newValue = double.tryParse(value);
                        //         if (newValue != null && newValue != _feetrest) {
                        //           setState(() {
                        //             _feetrest = newValue.clamp(0, 100) as double;
                        //           });
                        //         }
                        //       },
                        //       keyboardType: TextInputType.number,
                        //       controller: TextEditingController(
                        //         text: _feetrest.toStringAsFixed(0),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // new Expanded(
                        //   child: new Slider(
                        //     value: _feetrest,
                        //     min: 0,
                        //     max: 100,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _feetrest = value;
                        //       });
                        //     },
                        //   ),
                        // ),
 