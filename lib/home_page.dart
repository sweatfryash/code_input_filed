import 'package:codeinput/code_input_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String _code = '';
  var _length=6; //验证码长度，输入框框的个数
  var _type = CodeInputType.squareBox;
  double _sliderProcess=6.0;
  @override
  void initState() {
    super.initState();
    _controller.text='';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("验证码登录",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.5,
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Text("输入短信验证码", style: TextStyle(fontSize: 30)),
            Expanded(flex: 1, child: Container()),
            Text("短信验证码至 131 9999 9999", style: TextStyle(fontSize: 16, color: Colors.grey)),
            Expanded(flex: 5, child: Container()),
            Stack(
              children: <Widget>[
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InputCell(isFocused: _code.length == 0, text: _code.length>=1?_code.substring(0,1):''),
                    InputCell(isFocused: _code.length == 1, text: _code.length>=2?_code.substring(1,2):''),
                    InputCell(isFocused: _code.length == 2, text: _code.length>=3?_code.substring(2,3):''),
                    InputCell(isFocused: _code.length == 3, text: _code.length>=4?_code.substring(3,4):''),
                    InputCell(isFocused: _code.length == 4, text: _code.length>=5?_code.substring(4,5):''),
                    InputCell(isFocused: _code.length == 5, text: _code.length>=6?_code.substring(5,6):'',),
                  ],
                )*/
                ///[CodeInputRow]其实就是上面这段注释的代码里的Row封装一下
                //验证码输入框整行，
                CodeInputRow(code: _code,length: _length,type: _type),
                Opacity(
                  opacity: 0,
                  child: TextField(
                    //只能输入字母与数字
                    inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z,0-9,A-Z]"))],
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    onChanged: (String str) {
                      _code = str;
                      setState(() {});
                      if(str.length==_length){
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content:Text('填入的验证码是$_code'),
                              actions:<Widget>[
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ).then((v){
                          _controller.text='';
                          _code='';
                          setState(() {});
                        });
                      }
                    },
                  ),
                )
              ],
            ),
            Expanded(flex: 1, child: Container()),
            Text("60秒后重新发送", style: TextStyle(fontSize: 16, color: Colors.grey)),
            Expanded(flex: 1, child: Container()),
            Text('样式',style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: CodeInputType.squareBox,
                      groupValue: _type,
                      onChanged: (v){
                        _type = v;
                        setState(() {});
                      },
                    ),
                    Text('方框'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: CodeInputType.underLine,
                      groupValue: _type,
                      onChanged: (v){
                        _type = v;
                        setState(() {});
                      },
                    ),
                    Text('下划线'),
                  ],
                ),
              ],
            ),
            Expanded(flex: 1, child: Container()),
            Text('验证码长度  $_length',style: TextStyle(fontSize: 16)),
            Slider(
              max: 6.0,
              min: 4.0,
              divisions: 2,
              value: _sliderProcess,
              onChanged: (v){
                _sliderProcess = v;
                setState(() {});
              },
              onChangeEnd: (v){
                _length = v.toInt();
                _controller.text='';
                _code='';
                setState(() {});
              },
            ),
            Expanded(flex: 12, child: Container()),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
