import 'dart:async';

import 'package:flutter/material.dart';

class InputCell extends StatefulWidget {
  final bool isFocused;
  final String text;

  const InputCell({Key key, this.isFocused, this.text}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InputCellState();
}

class _InputCellState extends State<InputCell> {
  //未聚焦的边框
  final unfocusedDecoration = BoxDecoration(border: Border.all(color: Colors.grey[300]));
  //聚焦的边框
  final focusedDecoration = BoxDecoration(
    color: Colors.white,
      border: Border.all(color: Colors.blue),
      /*boxShadow: [
        BoxShadow(color: Colors.blue[300],offset: Offset(1, 1),blurRadius: 0.5,),
        BoxShadow(color: Colors.blue[300], offset: Offset(-1, -1), blurRadius:0.5),
        BoxShadow(color: Colors.blue[300], offset: Offset(1, -1), blurRadius: 0.5),
        BoxShadow(color: Colors.blue[300], offset: Offset(-1, 1), blurRadius: 0.5)
      ]*/);
  //聚焦的格子
  var focusedCell;
  //未聚焦的格子
  var unFocusedCell;
  //聚焦时的光标颜色，实现光标闪烁
  Color cursorColor = Colors.blue;
  Timer timer;

  @override
  void initState() {
    super.initState();
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        cursorColor = Colors.transparent;
        setState(() {});
        Future.delayed(Duration(milliseconds: 500), () {
          cursorColor = Colors.blue;
          setState(() {});
        });
      });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    unFocusedCell = Center(
      child: Text(
        widget.text ?? '',
        style: TextStyle(fontSize: 22),
      ),
    );
    focusedCell = Container(margin: EdgeInsets.symmetric(horizontal: 20.7, vertical: 11), color: cursorColor);

    return Container(
      width: 45,
      height: 45,
      decoration: widget.isFocused ? focusedDecoration : unfocusedDecoration,
      child: widget.isFocused ? focusedCell : unFocusedCell,
    );
  }
}
