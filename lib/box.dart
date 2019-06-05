import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      color: Colors.amber,
      home: StackPage(),
    );
  }
}

class BoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp
    (
        color: Colors.amber,
    home: new Scaffold(
    appBar: new AppBar(
    title: new Text("appBar"),
    backgroundColor: Colors.red,
    ),
    body:new Stack
    (
       children: <Widget>[
         new Container(
           color: Colors.purple,
           child: new Center(
             child: new Text(
                 "5",
               style: TextStyle(fontSize: 50,color: Colors.white),
             ),
           )
         ),new Container(
           color: Colors.red,
           height: 100,
           width: 120,
           child: new Center(
             child: new Text(
               "1",
               style: TextStyle(fontSize: 50,color: Colors.white),
             ),
           ),
         ),new Align(
           alignment: AlignmentDirectional.topEnd,
           child: Container(
             color: Colors.orange,
             width: 120,
             height: 200,
             child: Center(
               child: Text(
                 "2",
                 style: TextStyle(fontSize: 50, color: Colors.white),
               ),
             ),
           ),
         )
       ],
    )

    )
    );
  }
}

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stacked Squares'),
      ),
      body: SizedBox(
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.purple,
              height: 300,
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: 100,
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                color: Colors.orange,
                width: MediaQuery.of(context).size.width * 1 / 3,
                height: 200,
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
//            alignment: Alignment(1, -0.22),
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                color: Colors.blue,
                height: 100,
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: Center(
                  child: Text("3",
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                color: Colors.green,
                height: 200,
                width: MediaQuery.of(context).size.width * 1 / 3,
                child: Center(
                  child: Text("4",
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
