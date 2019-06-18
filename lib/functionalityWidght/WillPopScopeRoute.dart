import 'package:flutter/material.dart';

class WillPopScopeRoute extends StatefulWidget{
  @override
  _WillPopScopeRoute createState() {
    return _WillPopScopeRoute();
  }
}

class _WillPopScopeRoute extends State<WillPopScopeRoute>{

  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(_lastPressedAt==null||DateTime.now().difference(_lastPressedAt)>Duration(seconds: 1)){
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("连续两次返回退出"),
      ),
    );
  }

}