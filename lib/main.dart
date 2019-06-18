import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_route/scrollableWidght/CustomScrollViewTestRoute.dart';
import 'package:flutter_route/scrollableWidght/GridViewRoute.dart';
import 'package:flutter_route/scrollableWidght/ListViewRoute.dart';
import 'package:flutter_route/scrollableWidght/ScrollControllerTestRoute.dart';

import 'animationWidght/ScaleAnimationRoute.dart';
import 'baseWidget/Login.dart';
import 'baseWidget/LoginForm.dart';
import 'containerWidght/BoxRoute.dart';
import 'containerWidght/DecoratedBoxRoute.dart';
import 'containerWidght/PaddingRoute.dart';
import 'eventHandlerAndNotification/GestureDetectorTestRoute.dart';
import 'eventHandlerAndNotification/ListenerRoute.dart';
import 'eventHandlerAndNotification/NotificationListenerRoute.dart';
import 'functionalityWidght/ShareDataWidget.dart';
import 'functionalityWidght/ThemeDataRoute.dart';
import 'layOutWidght/FlexRoute.dart';
import 'layOutWidght/FlowRoute.dart';
import 'layOutWidght/RowAndColumn.dart';
import 'layOutWidght/StackPositionedRoute.dart';

void main() {
  //页面调试开关展示辅助线
  debugPaintSizeEnabled = false;
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
        'paddingRoute': (context) => PaddingRoute(),
        'boxRoute': (context) => BoxRoute(),
        'decoratedBoxRoute': (context) => DecoratedBoxRoute()
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
//            FlatButton(
//              child: Text('flexRoute'),
//              onPressed: () {
//                Navigator.pushNamed(context, 'flexRoute');
//              },
//            ),
//            FlatButton(
//              child: Text("flowRoute"),
//              onPressed: () {
//                Navigator.pushNamed(context, 'flowRoute');
//              },
//            ),
//            RaisedButton(
//              child: Text("StackPositionedRoute"),
//              onPressed: () {
//                Navigator.pushNamed(context, "StackPositionedRoute");
//              },
//            ),
//            FlatButton(
//              child: Text("login"),
//              onPressed: () {
//                Navigator.pushNamed(context, "loginRoute");
//              },
//            ),
//            FlatButton(
//              child: Text("loginForm"),
//              onPressed: () {
//                Navigator.pushNamed(context, "loginFormRoute");
//              },
//            ),
//            FlatButton(
//              child: Text('paddingRoute'),
//              onPressed: () {
//                Navigator.pushNamed(context, 'paddingRoute');
//              },
//            ),
//            FlatButton(
//              child: Text('BoxRoute'),
//              onPressed: () {
//                Navigator.pushNamed(context, 'boxRoute');
//              },
//            ),
//            FlatButton(
//              child: Text('decoratedBoxRoute'),
//              onPressed: () {
//                Navigator.pushNamed(context, 'decoratedBoxRoute');
//              },
//            ),
//            FlatButton(
//              child: Text("TransformRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new TransformRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("ContainerRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new ContainerRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text('AppBar'),
//              onPressed: (){
//                Navigator.push(context,
//                                    new MaterialPageRoute(builder:(context)=>new ScaffoldTabBarRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text('SingleChildScrollView'),
//              onPressed: (){
//                Navigator.push(context,
//                                    new MaterialPageRoute(builder:(context)=>new SingleChildScrollViewRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("ListViewRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new ListViewRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("GridViewRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new GridViewRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("CustomScrollViewTestRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new CustomScrollViewTestRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("ScrollControllerTestRoute "),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new ScrollControllerTestRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("InheritedWidgetTestRoute "),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new InheritedWidgetTestRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("ThemeTestRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new ThemeTestRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("ListenerRoute"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new ListenerRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text('GestureDetectorTestRoute'),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new GestureDetectorTestRoute()));
//              },
//            ),
//            FlatButton(
//              child: Text("NotificationListenerRoute"),
//              onPressed: (){
//                Navigator.push(context,
//                                    new MaterialPageRoute(builder:(context)=>new NotificationListenerRoute()));
//              },
//            ),
            FlatButton(
              child: Text("ScaleAnimationRoute"),
              onPressed: (){
                Navigator.push(context,
                    new MaterialPageRoute(builder:(context)=>new ScaleAnimationRoute()));
              },
            ),
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
