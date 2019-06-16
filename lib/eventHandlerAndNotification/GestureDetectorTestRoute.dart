import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureDetectorTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GestureDetectorTestRoute'),
        ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[GestureDetectorTest(), DragTest()],
//      ), //单击双击长按

        //  body: DragTest(), //拖拽

        //  body:_ScaleTestRoute() //图片缩放
        //  body:_GestureRecognizerTestRoute(),//富文本点击

        body: BothDirectionTestRoute(),//手势冲突
    );
  }
}

class GestureDetectorTest extends StatefulWidget {
  @override
  _GestureDetectorTest createState() {
    return _GestureDetectorTest();
  }
}

class _GestureDetectorTest extends State<GestureDetectorTest> {
  String _operation = "No Gesture detected!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300,
          height: 100,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          updateState("onTap");
        },
        onDoubleTap: () {
          updateState("onDoubleTap");
        },
        onLongPress: () => updateState("onLongPress"),
      ),
    );
  }

  void updateState(String input) {
    setState(() {
      _operation = input;
    });
  }
}

class DragTest extends StatefulWidget {
  @override
  _DragTest createState() => new _DragTest();
}

class _DragTest extends State<DragTest> with SingleTickerProviderStateMixin {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onPanDown: (DragDownDetails e) {
              print("用户手指按下位置:${e.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails e) {
              //print(e.delta);
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (e) {
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() {
    return _ScaleTestRouteState();
  }
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("images/firework.jpg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerTestRouteState();
  }
}

class _GestureRecognizerTestRouteState
    extends State<_GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "你好世界"),
        TextSpan(
          text: "点我变色",
          style: TextStyle(
              fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
          recognizer: _tapGestureRecognizer
            ..onTap = () {
              setState(() {
                _toggle = !_toggle;
              });
            },
        ),
        TextSpan(text: "你好世界"),
      ])),
    );
  }
}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() =>
      new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        )
      ],
    );
  }
}
