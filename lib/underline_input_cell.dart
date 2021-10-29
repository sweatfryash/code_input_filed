import 'package:flutter/material.dart';

class UnderlineInputCell extends StatelessWidget {
  const UnderlineInputCell({
    Key? key,
    required this.isFocused,
    required this.text,
  }) : super(key: key);

  final bool isFocused;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 45,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isFocused ? Colors.blue : Colors.black54,
            width: 2,
          ),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
