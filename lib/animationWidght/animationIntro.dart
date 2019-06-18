import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';

class anmimationIntro {

  final CurvedAnimation curve =
      new CurvedAnimation(parent: null, curve: Curves.easeIn);

  final AnimationController controller = new AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: null);

  final AnimationController animationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      lowerBound: 10.0,
      upperBound: 20.0,
      vsync: null
  );

  final Tween doubleTween = new Tween<double>(begin: -200.0, end: 0.0);

  final Tween colorTween =
  new ColorTween(begin: Colors.transparent, end: Colors.black54);

  final AnimationController animationController2 = new AnimationController(
      duration: const Duration(milliseconds: 500), vsync: null);
  Animation<int> alpha = new IntTween(begin: 0, end: 255).animate(null);

  final AnimationController animationController3 = new AnimationController(
      duration: const Duration(milliseconds: 500), vsync: null);
  final Animation curve2 =
  new CurvedAnimation(parent: null, curve: Curves.easeOut);
  Animation<int> alpha2 = new IntTween(begin: 0, end: 255).animate(null);
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return math.sin(t * math.pi * 2);
  }
}

abstract class TickerProvider {
  //通过一个回调创建一个Ticker
  Ticker createTicker(TickerCallback onTick);
}