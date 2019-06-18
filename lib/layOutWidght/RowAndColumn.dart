import 'package:flutter/material.dart';

class RowRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RowAndColum'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('hello world'), Text('I am jack')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text('hello world'), Text('I am jack')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[Text('hello world'), Text('I am jack')],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                " hello world ",
                style: TextStyle(fontSize: 30.0),
              ),
              Text('I am jack')
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
