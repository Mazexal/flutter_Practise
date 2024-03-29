import 'package:flutter/material.dart';

import 'TurnBox.dart';

class TurnBoxTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TurnBoxTestRoute'),
      ),
      body: Column(
        children: <Widget>[
          TurnBoxShowState()
        ],
      ),
    );
  }
}

class TurnBoxShowState extends StatefulWidget {
  @override
  _TurnBoxShowState createState() {
    _TurnBoxShowState();
  }
}

class _TurnBoxShowState extends State<TurnBoxShowState> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: <Widget>[
          TurnBox(
            turns: _turns,
            speed: 500,
            child: Icon(Icons.refresh, size: 50,),
          ),
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: Icon(Icons.refresh, size: 150.0,),
          ),
          RaisedButton(
            child: Text("顺时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          ),
          RaisedButton(
            child: Text("逆时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
          )
        ],
      ),
    );
  }
}
