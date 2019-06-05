import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:isolate';
import 'dart:convert';


//在Flutter里AsyncTask场景下是怎么工作的
void main() {
  runApp(new asyncTaskApp());
}

class asyncTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'AsyncTask在Flutter里的实现',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new asyncTask(),
    );
  }

}

class asyncTask extends StatefulWidget {
  //asyncTask({Key key}) :super(key: key)
  asyncTask({Key key}) : super(key: key);
  @override
  _SampleAppPageState createState() => new _SampleAppPageState();

}

class _isolate extends State<asyncTask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Icon(Icons.ac_unit),
      ),
    );
  }

}


class _SampleAppPageState extends State<asyncTask> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadData();
    isolateData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getBody();
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
  isolateData() async {
    ReceivePort receivePort = new ReceivePort();
    //recevePort.sendPort(啥意思)
    await Isolate.spawn(dataLoad, receivePort.sendPort);
    // The 'echo' isolate sends it's SendPort as the first message
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");
    setState(() {
      widgets = msg;
    });
  }

//  getProgressDialog(){
//    return new Center(child: new CircularProgressIndicator());
//  }
  loadData() async {
    String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  ListView getListView() =>
      new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      );

  Widget getRow(int i) {
    return
      new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row${widgets[i]["title"]}"));
  }

  //返回个进度圈圈
  getProgressDialog() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  static dataLoad(SendPort sendPort) async {
    ReceivePort port = new ReceivePort();
    sendPort.send(port.sendPort);
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataUrl = data;

      http.Response response = await http.get(dataUrl);
      replyTo.send(json.decode(response.body));
    }

  }


}



