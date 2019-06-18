import 'package:flutter/material.dart';

import 'GrowTransition.dart';

class ScaleAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放动画'),
      ),
      body: Column(
        children: <Widget>[ScaleAnimationWidget()],
      ),
    );
  }
}

class ScaleAnimationWidget extends StatefulWidget {
  @override
  _ScaleAnimationWidget2 createState() {
    return _ScaleAnimationWidget2();
  }
}

class _ScaleAnimationWidget extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn); //弹簧效果
    animation = new Tween(begin: 0.0, end: 300.0)
        .animate(animation) //注意, 这里的begin和end必须是double, 如果你简写了的话会出错
          ..addListener(() {
            setState(() {});
          });
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)//注意, 这里的begin和end必须是double, 如果你简写了的话会出错
//      ..addListener(() {
//        setState(() {});
//      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      "images/firework.jpg",
      width: animation.value,
      height: animation.value,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
//////////////////////////简化代码

class _ScaleAnimationWidget2 extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3));
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(
      animation: animation,
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return GrowTransition(
        child: Image.asset(
          "images/firework.jpg",
//        width: animation.value,
//        height: animation.value,
        ),
        animation: animation);
  }
}
