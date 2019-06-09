import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  State createState() {
    _TapboxAState createState() => new _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32, color: Colors.blue),
          ),
        ),
        width: 200,
        height: 200,
        decoration:
            new BoxDecoration(color: _active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}
