import 'package:flutter/material.dart';

void main(){
  runApp(new defaultApp());
}
//flutter 加载图片要在 pubspec.yaml里声明图片文件
class Strings{
  static String IMAGE_WELCOME="welcome to flutter";
}

class defaultApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Resource App",
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: resourceData(),
    );
  }
}
class resourceData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}