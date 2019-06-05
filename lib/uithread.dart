import 'package:http/http.dart'as http;
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
//_MyHomePageState createState() => new _MyHomePageState();
  @override
  _SampleAppPageState createState() =>new _SampleAppPageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {

        var jsonString = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonString);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\n Http status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SampleAppPageState extends State<MyHomePage> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("显示JSON请求数据List"),
      ),
      body: new ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context,int position){
            return getRow(position);
          },

      ),
    );
  }
  loadData() async{
    String dataUrl="https://jsonplaceholder.typicode.com/posts";
    http.Response response=await http.get(dataUrl);
    setState((){
      widgets=json.decode(response.body);
    });
  }
  Widget getRow(int i){
    return new Padding(
      padding: new EdgeInsets.all(10),
      child: new Text("Rows${widgets[i]["title"]}"),
    );
  }

}

