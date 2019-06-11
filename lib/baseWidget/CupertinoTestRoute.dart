import 'package:flutter/cupertino.dart';

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Bar"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("Press"),
          onPressed: () {},
          color: CupertinoColors.activeBlue,
        ),
      ),
    );
  }
}
