import 'package:flutter/material.dart';

class ListenerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件处理'),
      ),
      body: Column(
        children: <Widget>[
          ListenerTest(),
        ],
      ),
    );
  }
}

class ListenerTest extends StatefulWidget {
  @override
  _ListenerTest createState() {
    return _ListenerTest();
  }
}

class _ListenerTest extends State<ListenerTest> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
//    return Listener(
//      child: Container(
//        alignment: Alignment.center,
//        color: Colors.blue,
//        width: 500,
//        height: 350,
//        child: Text(_event?.toString() ?? "",
//            style: TextStyle(color: Colors.white)),
//      ),
//      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
//      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
//      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
//    );

//    return Listener(
//        child: ConstrainedBox(
//          constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//          child: Center(child: Text("Box A")),
//        ),
//        behavior: HitTestBehavior.opaque,//这里决定了点击事件的范围大小
//        onPointerDown: (event) => print("down A")
//    );

//    return Stack(
//      children: <Widget>[
//        Listener(
//          child: ConstrainedBox(
//            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
//            child: DecoratedBox(
//                decoration: BoxDecoration(color: Colors.blue)),
//          ),
//          onPointerDown: (event) => print("down0"),
//        ),
//        Listener(
//          child: ConstrainedBox(
//            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
//            child: Center(child: Text("左上角200*100范围内非文本区域点击")),
//          ),
//          onPointerDown: (event) => print("down1"),
//          behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
//        )
//      ],
//    );

    return Listener(
      child: IgnorePointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 100.0,
          ),
          onPointerDown: (event) => print("in"),
        ),
      ),
      onPointerDown: (event) => print("up"),
    );
  }
}
