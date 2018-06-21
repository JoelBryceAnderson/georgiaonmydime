import 'package:flutter/material.dart';

class NavigationScreen {
  NavigationScreen({
    Widget screen,
    TickerProvider vsync,
  })  : _screen = screen,
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _screen;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(0.0, 0.02), // Slightly down.
            end: Offset.zero,
          ).animate(_animation),
          child: _screen),
    );
  }
}
