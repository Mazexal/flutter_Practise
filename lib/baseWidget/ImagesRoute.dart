import 'package:flutter/material.dart';
import 'package:flutter_route/baseWidget/SwitchAndCheckBox.dart';

class ImagesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("imagesShow"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('images'),
            Image(image: AssetImage("images/avatar.png"), width: 100.0),
            Image(
              image: AssetImage("images/firework.jpg"),
              width: 120,
            ),
            Image.network("http://i0.hdslb.com/bfs/article/effff9be8c1bd6914ac40f2c3719da39a28bf4de.png",width: 100,),
            SwitchAndCheckBox(),
          ],
        ),
      ),
    );
  }
}
