import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandonWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Scaffold(
      appBar: new AppBar(
        title: new Text("randon words"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(wordPair.toString()),
            Text(
              '123456' * 4,
              maxLines: 2,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  height: 2.8,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.grey[100],
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "textSpanHead: "),
              TextSpan(
                  text: "www.baidu.com",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline))
            ])),
            RaisedButton(
              onPressed: () {},
              child: Text("RaisedButton"),
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
