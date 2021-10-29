import 'package:codeinput/square_input_cell.dart';
import 'package:codeinput/underline_input_cell.dart';
import 'package:flutter/material.dart';

enum CodeInputType {
  squareBox, //方框类型
  underLine //下划线类型
}

class CodeInputRow extends StatelessWidget {
  CodeInputRow({
    Key? key,
    required this.code,
    this.length = 6,
    this.type = CodeInputType.squareBox,
  }) : super(key: key);

  ///[code]已经输入验证码 [length]需要几个框，即规定的验证码的长度
  final String code;
  final int length;
  final CodeInputType type;

  @override
  Widget build(BuildContext context) {
    List<Widget> cells = <Widget>[];
    for (int i = 1; i <= length; i++) {
      cells.add(
        type == CodeInputType.squareBox
            ? SquareInputCell(
                isFocused: code.length == i - 1,
                text: code.length >= i ? code.substring(i - 1, i) : '')
            : UnderlineInputCell(
                isFocused: code.length == i - 1,
                text: code.length >= i ? code.substring(i - 1, i) : ''),
      );
    }

    return Row(
      mainAxisAlignment: length == 4
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.spaceBetween,
      children: cells,
    );
  }
}
