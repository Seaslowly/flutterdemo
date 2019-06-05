import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//void main() {
//  generateWordPairs().forEach(print);
//}
void main() => runApp(
   // MyApp()
    //SampleApp()
    fadeApp()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //定义对象
    final wordPair=new WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          //(wordPair.asPascalCase) 随机生成个英文名称
         // title: (wordPair.asPascalCase).toString(),
          title: new RandomWordsState().toString()
      ),

    );
  }
}
//写个点击按钮淡出效果
class fadeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "淡出效果实现",
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new FadeAppTest (title:"淡出效果实现"),
    );
  }

}

class FadeAppTest extends StatefulWidget {
  FadeAppTest({Key key,this.title}) : super(key:key);
  final String title;
  @override
  _FadeAppTest createState()=> new _FadeAppTest();
}

class _FadeAppTest extends State<FadeAppTest> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title:new Text("实现淡入淡出效果"),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
              opacity: curve,
             child:new FlutterLogo(
               size: 100,
             ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.brush),
          tooltip: 'Fade',
          onPressed: (){
            controller.forward();
          }),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
   // super.initState(); vsync 垂直同步
    controller=new AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
    );
    curve=new CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
    );
  }

  
}
//点击按钮更改文字
class SampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "SampleApp",
      theme: new ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: new SampleAppPage(),
    );

  }


}
/**
 * 更改控件的方法
 */
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppState createState()=>new _SampleAppState();
}

class _SampleAppState extends State<SampleAppPage>{
  String textToShow="I Like Flutter!";
  //写方法都写在state里
  void _upgradeText(){
    setState(() {
      textToShow="Flutter! is Awesome";
    });
  }
  void _updateText(){
    setState(() {
      textToShow="喵喵喵";
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("AppBar"),
      ),
      body: new Center(
        child: new Text(textToShow),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _upgradeText,
          tooltip: 'UpgradeText',
          child: new Icon(Icons.update),
      ),

    );
  }

}
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair=new WordPair.random();
    //dart在变量前增加下划线会强制变为私有变量
    final _suggestions=<WordPair>[];
    final _bigFont=const TextStyle(fontSize: 18);

    return new Text(wordPair.asPascalCase);
  }

}


class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Column(
                // Column is also layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text(
                      "I Like Flutter !",
                      style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "new test"
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
