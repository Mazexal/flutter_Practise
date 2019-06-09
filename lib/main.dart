import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'NewRoute.dart';
import 'RandonWords.dart';
import 'baseWidget/CupertinoTestRoute.dart';
import 'baseWidget/Login.dart';
import 'baseWidget/LoginForm.dart';
import 'layOutWeight/RowAndColumn.dart';
import 'layOutWeight/FlexRoute.dart';
import 'layOutWeight/FlowRoute.dart';
import 'layOutWeight/StackPositionedRoute.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "rowAndColumn": (context) => RowRoute(),
        "flexRoute": (context) => FlexRoute(),
        "flowRoute": (context) => FlowRoute(),
        "StackPositionedRoute": (context) => StackPositionedRoute(),
        "loginRoute": (context) => LoginRoute(),
        "loginFormRoute": (context) => LoginFormRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
                child: Text("rowAndColumn"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "rowAndColumn", arguments: "hi");
                }),
            FlatButton(
              child: Text('flexRoute'),
              onPressed: () {
                Navigator.pushNamed(context, 'flexRoute');
              },
            ),
            FlatButton(
              child: Text("flowRoute"),
              onPressed: () {
                Navigator.pushNamed(context, 'flowRoute');
              },
            ),
            RaisedButton(
              child: Text("StackPositionedRoute"),
              onPressed: () {
                Navigator.pushNamed(context, "StackPositionedRoute");
              },
            ),
            FlatButton(
              child: Text("login"),
              onPressed: () {
                Navigator.pushNamed(context, "loginRoute");
              },
            ),
            FlatButton(
              child: Text("loginForm"),
              onPressed: () {
                Navigator.pushNamed(context, "loginFormRoute");
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
