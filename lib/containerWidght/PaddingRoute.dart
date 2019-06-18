import 'package:flutter/material.dart';

class PaddingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('padding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(left: 8),child: Text('Hello World'),),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8),child: Text('I am Jack'),),
            Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),child: Text('your friend'),)
          ],
        ),
      ),
    );
  }
}
