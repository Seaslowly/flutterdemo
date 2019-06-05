import 'package:flutter/material.dart';

void main(){
  runApp(new lifeCycleApp());
}

class lifeCycleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "LifeCycle APP",
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new lifeCycleWatch(),
    );
  }


}

class lifeCycleWatch extends StatefulWidget{
  @override
  _LifecycleWatcherState createState()=>new _LifecycleWatcherState();
}

class _LifecycleWatcherState  extends State<lifeCycleWatch> with WidgetsBindingObserver{
  AppLifecycleState _appLifecycleState;
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
      if (_appLifecycleState == null) {
        //return new Text('This widget has not observed any lifecycle changes.', textDirection: TextDirection.ltr);
        return getColumn();
      }else {
        return new Text(
            'The most recent lifecycle state this widget observed was: $_appLifecycleState.',
            textDirection: TextDirection.ltr);
      }
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    _appLifecycleState=state;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Widget getRow(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("test1"),
          new Text("test2"),
          new Text("test3")
        ],
      );
  }
 Widget getColumn(){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("test1"),
          new Text("test2"),
          new Text("test3")
        ],
      );
 }
}