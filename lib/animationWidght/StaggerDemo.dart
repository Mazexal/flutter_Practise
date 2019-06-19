import 'package:flutter/material.dart';

import 'StaggerAnimation.dart';

class StaggerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('交错动画'),
      ),
      body: Column(
        children: <Widget>[StaggerDemo()],
      ),
    );
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() {
    return _StaggerDemoState();
  }
}

class _StaggerDemoState extends State<StaggerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _playAnimation,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: StaggerAnimation(controller: _controller),
        ),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      _controller.dispose();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
