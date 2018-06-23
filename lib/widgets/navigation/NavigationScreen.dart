import 'package:flutter/material.dart';

class NavigationScreen {
  NavigationScreen({
    Widget screen,
    TickerProvider vsync,
  })  : _screen = screen,
        controller = new AnimationController(
          duration: new Duration(milliseconds: 400),
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.bounceInOut),
    );
  }

  final Widget _screen;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    return new FadeTransition(
      opacity: _animation,
      child: _screen,
    );
  }
}
