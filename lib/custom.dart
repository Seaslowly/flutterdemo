import 'package:flutter/material.dart';

void main(){
  runApp(new defaultApp());
}
class CustomButton extends StatelessWidget{
  final String lable;
  CustomButton(this.lable);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //自定义按钮
    return new RaisedButton(onPressed:() {},child: new Text(lable),);
  }

}

class defaultApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "自定义空间App",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new _defaultAppTest(),
    );
  }

}

class _defaultAppTest extends StatefulWidget{
  _defaultAppTest({Key key}) : super(key: key);
  @override
  _useCustomButton createState() => new _useCustomButton();
}


class _useCustomButton extends State<_defaultAppTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('自定义按钮'),

      ),
      body: new Center(
        child:new Container(
          
          child:new CustomButton("喵喵喵"),
        ),



      ),
      
    );
  }
  
  
}