import 'package:flutter/material.dart';

class BoxRoute extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox and SizedBox'),
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: 50, minWidth: double.infinity),
            child: Container(
              height: 5,
              child: redBox,
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: redBox,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60, minHeight: 90),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 160, minHeight: 190),
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60, minHeight: 90),
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 20, minHeight: 40),
                child: redBox,
              ),
            ),
          )
        ],
      ),
    );
  }
}
