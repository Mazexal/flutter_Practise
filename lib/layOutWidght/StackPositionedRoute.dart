import 'package:flutter/material.dart';

class StackPositionedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('层叠布局'),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ]),
        ));
  }
}
