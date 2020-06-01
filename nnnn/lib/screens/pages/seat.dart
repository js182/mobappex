import 'package:Snooze/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Seat extends StatefulWidget {
  @override
  _SeatState createState() => _SeatState();
}

class Favorite{
  String _name;
  double back, middle, feet;
  Favorite(this._name, this.back, this.middle, this.feet);
  String get name => this._name;
  double get backValue => this.back;
  double get middleValue => this.middle;
  double get feetValue => this.feet;
}

class _SeatState extends State<Seat> {
  double _minRange = 0.0;
  double _backrestMaxRange = 88.0;
  double _middleMaxRange = 30.0;
  double _feetrestMaxRange = 90.0;

  double _backrestValue = 88.0;
  double _middleValue = 0.0;
  double _feetrestValue = 5.0;

  double _spacing = 50.0;

  double _inputSize = 50.0;

  TextStyle _textstyle = new TextStyle(fontSize: 20.0);

  int _indexSelected = -1;

  bool _isFavorite = false;

  bool _isDraggingBackrest = false;
  bool _isDraggingMiddlerest = false;
  bool _isDraggingFeetrest = false;

  List <Favorite> _favorites;

  @override
  void initState(){
    super.initState();
    _favorites.add(new Favorite('NAME', 8.0, 4.0, 88.0));
  }

  void setRestPosition(double backrest, double middle, double feetrest){
    _backrestValue = backrest;
    _middleValue = middle;
    _feetrestValue = feetrest;
  }

  void _checkChoiceChip(){
    _indexSelected = _compareWODec(_backrestValue, 0.0) && _compareWODec(_middleValue, 0.0) && _compareWODec(_feetrestValue, 90.0)
    ? 0 
    : _indexSelected = _compareWODec(_backrestValue, 88.0) && _compareWODec(_middleValue, 0.0) && _compareWODec(_feetrestValue, 0.0)
      ? 1 
      : _indexSelected = _compareWODec(_backrestValue, 45.0) && _compareWODec(_middleValue, 30.0) && _compareWODec(_feetrestValue, 15.0)
        ? 2 
        : -1;
    _isFavorite = _indexSelected!=-1 ? true : false;
  }
  bool _compareWODec(double x, double y){
    return int.parse(x.toStringAsFixed(0))==y.toInt();
  }

  Future<String> addFavorite(BuildContext context){

    TextEditingController _controller = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Add position as favorite'),
        content: new Container(
          child: new Row(
            children: [
              new Text(
                'Name: '
              ),
              new Container(
                width: 170.0,
                child: new TextField(
                  controller: _controller,
                  maxLength: 20,
                  autofocus: true,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget> [
          OutlineButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          OutlineButton(
            child: Text('Add'),
            onPressed: () => Navigator.of(context).pop(_controller.text.toString()),
          )
        ],
      );
    });
  }

  void _manageFavorite(){
    print('addFavourite');
    if(!_isFavorite){
      addFavorite(context).then((onValue) {

        print('added Favorite: '+onValue);
      });


    }
  }

  List<Widget> choiceChips(){
    List<Widget> chips;
    for(int i=0; i<_favorites.length; i++){
      chips.add(
        ChoiceChip(
          label: Text(_favorites[i].name),
          selected: _indexSelected == i,
          onSelected: (value) {
            setState(() {
              _indexSelected = value ? i : -1;
              setRestPosition(_favorites[i].back, _favorites[i].middle, _favorites[i].feet);
            });
          },
        ),
      );
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    _checkChoiceChip();
    return Container(
      child: new Column(
        children: <Widget> [
          new SizedBox(
            height: 10.0,
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              new Expanded(
                //animation of lounger
                child: new Center(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomPaint(
                        size: Size(100, 300),
                        painter: BackrestPainter(100.0, -math.pi+math.pi*.5/90.0*_backrestValue, 
                                                  _isDraggingBackrest),
                      ),
                      new Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget> [
                          CustomPaint(
                            size: Size(100, 300),
                            painter: MiddlePainter(100.0, -math.pi*.5/90.0*_middleValue, 
                                                      _isDraggingMiddlerest),
                          ),
                          CustomPaint(
                            size: Size(100, 300),
                            painter: FootrestPainter(100.0, math.pi*.5-math.pi*.5/90.0*(_feetrestValue+_middleValue), 
                                                      -math.pi*.5/90.0*_middleValue, _isDraggingFeetrest),
                          ),
                        ],
                      ),
                      SizedBox(width: 100,),
                    // child: new Container(
                    //   child: Text('Index 2: '+AppLocalization.of(context).seat),
                    // ),
                    ],
                  ),
                ),
              ),
              new Expanded(
                child: new Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        new SizedBox(
                          height: 50.0,
                        ),
                        
                        //favourite star
                        new IconButton(
                          onPressed: _manageFavorite,
                          icon: _isFavorite ? Icon(Icons.star) : Icon(Icons.star_border,),
                        ),
                      ],
                    ),
                    //BACKREST
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Semantics(
                          child: SizedBox(
                            width: _inputSize,
                            height: _inputSize,
                            child: TextField(
                              textAlign: TextAlign.end,
                              style: _textstyle,
                              onSubmitted: (value) {
                                final newValue = double.tryParse(value);
                                if (newValue != null && newValue != _backrestValue) {
                                  setState(() {
                                    _backrestValue = newValue.clamp(_minRange, _backrestMaxRange) as double;
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: TextEditingController(
                                text: _backrestValue.toStringAsFixed(0),
                              ),
                            ),
                          ),
                        ),
                        new Text(
                          '°',
                          style: _textstyle,
                        ),
                        new Expanded(
                          child: new Slider(
                            value: _backrestValue,
                            min: _minRange,
                            max: _backrestMaxRange,
                            onChanged: (value) => setState(() => _backrestValue = value),
                            onChangeStart: (value) => setState(() => _isDraggingBackrest=true),
                            onChangeEnd: (value) => setState(() => _isDraggingBackrest=false),
                          ),
                        ),
                      ],
                    ),
                    new SizedBox(
                      height: _spacing,
                    ),
                    //MIDDLE
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Semantics(
                          child: SizedBox(
                            width: _inputSize,
                            height: _inputSize,
                            child: TextField(
                              textAlign: TextAlign.end,
                              style: _textstyle,
                              onSubmitted: (value) {
                                final newValue = double.tryParse(value);
                                if (newValue != null && newValue != _middleValue) {
                                  setState(() {
                                    _middleValue = newValue.clamp(_minRange, _middleMaxRange) as double;
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: TextEditingController(
                                text: _middleValue.toStringAsFixed(0),
                              ),
                            ),
                          ),
                        ),
                        new Text(
                          '°',
                          style: _textstyle,
                        ),
                        new Expanded(
                          child: new Slider(
                            value: _middleValue,
                            min: _minRange,
                            max: _middleMaxRange,
                            onChanged: (value) => setState(() => _middleValue = value),
                            onChangeStart: (value) => setState(() => _isDraggingMiddlerest=true),
                            onChangeEnd: (value) => setState(() => _isDraggingMiddlerest=false),
                          ),
                        ),
                      ],
                    ),
                    new SizedBox(
                      height: _spacing,
                    ),
                    //FEETREST
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Semantics(
                          child: SizedBox(
                            width: _inputSize,
                            height: _inputSize,
                            child: TextField(
                              textAlign: TextAlign.end,
                              style: _textstyle,
                              onSubmitted: (value) {
                                final newValue = double.tryParse(value);
                                if (newValue != null && newValue != _feetrestValue) {
                                  setState(() {
                                    _feetrestValue = newValue.clamp(_minRange, _feetrestMaxRange) as double;
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: TextEditingController(
                                text: _feetrestValue.toStringAsFixed(0),
                              ),
                            ),
                          ),
                        ),
                        new Text(
                          '°',
                          style: _textstyle,
                        ),
                        new Expanded(
                          child: new Slider(
                            value: _feetrestValue,
                            min: _minRange,
                            max: _feetrestMaxRange,
                            onChanged: (value) => setState(() => _feetrestValue = value),
                            onChangeStart: (value) => setState(() => _isDraggingFeetrest=true),
                            onChangeEnd: (value) => setState(() => _isDraggingFeetrest=false),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choiceChips(),
                // ChoiceChip(
                //   label: Text('Lay'),
                //   selected: _indexSelected == 0,
                //   onSelected: (value) {
                //     setState(() {
                //       _indexSelected = value ? 0 : -1;
                //       setRestPosition(0.0, 0.0, 90.0);
                //     });
                //   },
                // ),
                // const SizedBox(width: 20.0),
                // ChoiceChip(
                //   label: Text('Sit'),
                //   selected: _indexSelected == 1,
                //   onSelected: (value) {
                //     setState(() {
                //       _indexSelected = value ? 1 : -1;
                //       setRestPosition(88.0, 0.0, 0.0);
                //     });
                //   },
                // ),
                // const SizedBox(width: 20.0),
                // ChoiceChip(
                //   label: Text('Zerogravity'),
                //   selected: _indexSelected == 2,
                //   onSelected: (value) {
                //     setState(() {
                //       _indexSelected = value ? 2 : -1;
                //       setRestPosition(45.0, 30.0, 15.0);
                //     });
                //   },
                // ),
            )
          )
        ],
      ),
    );
  }
}

class BackrestPainter extends CustomPainter {
  final double radius;
  final double radians;
  final bool isDragging;
  BackrestPainter(this.radius, this.radians, this.isDragging);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = isDragging? Colors.red : Colors.black
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Offset angle = Offset(size.width, size.height / 2);

    path.moveTo(angle.dx, angle.dy);

    Offset pointOnCircle = Offset(
      radius * math.cos(radians) + angle.dx,
      radius * math.sin(radians) + angle.dy,
    );

    path.lineTo(pointOnCircle.dx, pointOnCircle.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MiddlePainter extends CustomPainter {
  final double radius;
  final double radians;
  final bool isDragging;
  MiddlePainter(this.radius, this.radians, this.isDragging);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = isDragging? Colors.red : Colors.black
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Offset angle = Offset(0.0, size.height / 2);

    path.moveTo(angle.dx, angle.dy);

    Offset pointOnCircle = Offset(
      radius * math.cos(radians) + angle.dx,
      radius * math.sin(radians) + angle.dy,
    );

    path.lineTo(pointOnCircle.dx, pointOnCircle.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class FootrestPainter extends CustomPainter {
  final double radius;
  final double radians;
  final double startradians;
  final bool isDragging;
  FootrestPainter(this.radius, this.radians, this.startradians, this.isDragging);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = isDragging? Colors.red : Colors.black
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Offset angle = Offset(
      radius * math.cos(startradians),
      radius * math.sin(startradians) + size.height/2,
    );

    path.moveTo(angle.dx, angle.dy);

    Offset pointOnCircle = Offset(
      radius * math.cos(radians) + angle.dx,
      radius * math.sin(radians) + angle.dy,
    );

    path.lineTo(pointOnCircle.dx, pointOnCircle.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
