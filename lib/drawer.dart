import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new DwidgetWithLink(),
     
      
    );
  }
}

class DwidgetWithLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("this is AppBar"),
      ),
      body: new Text("Body"),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("DrawerHead"),
              decoration:new BoxDecoration(
                color: Colors.lightGreenAccent
              )
            ),new ListTile(
              title: new Text("ListTitle =>1"),
              onTap: (){
                Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new FirstPage()));
              }
            ),new ListTile(
              title: new Text("ListTitle =>2"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SecondPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class DWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      drawer: new Drawer(
          child: new DrawerHeader(
        child: new Column(
          children: <Widget>[
            new Text("text1"),
            new Icon(Icons.send),
            new Text("Meow"),
          ],
        ),
        decoration: new BoxDecoration(color: Colors.orange),
      )),
      appBar: new AppBar(
        title: new Text("appBar title"),
      ),
      body: new Text("body"),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First Page"),
      ),
      body: new Text("I belongs to First Page"),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Text("I belongs to Second Page"),
    );
  }
}
