import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "test Route",
      home: new firstScreen(),
    );
  }
}

//第一页
class firstScreen extends StatefulWidget {
  @override
  _routeTest createState() => new _routeTest();
}

class _routeTest extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第一页"),
      ),
      body: new Center(
          child: Column(
              children: <Widget>[
                Text('meow'),
                Icon(Icons.accessibility),
              ])),
      floatingActionButton: new FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new secondScreen()),
        );
      }),
    );
  }
}

class secondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第二页"),
      ),
      body: new Center(
        child: new Icon(Icons.backup),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new thirdScreen()),
        );
      }),

    );
  }
}

class thirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第三页"),
      ),
    );
  }
}
