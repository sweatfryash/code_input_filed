import 'package:flutter/material.dart';

import 'input_cell.dart';

class CodeInputRow extends StatefulWidget{
  ///[code]已经输入验证码 [length]需要几个框，即规定的验证码的长度
  final String code;
  final int length;
  const CodeInputRow({Key key, this.code, this.length}) : super(key: key);

  @override
  _CodeInputRowState createState() => _CodeInputRowState();
}

class _CodeInputRowState extends State<CodeInputRow> {
  List<Widget> _cells = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _newCells = List();
    for(int i = 1;i<=widget.length;i++){
      _newCells.add(InputCell(isFocused: widget.code.length == i-1, text: widget.code.length>=i?widget.code.substring(i-1,i):''));
    }
    _cells=_newCells;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _cells,
    );
  }


}