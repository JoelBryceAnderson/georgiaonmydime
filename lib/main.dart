import 'dart:async';

import 'package:flutter/material.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/screens/main/MainPagerScreen.dart';

void main() => runApp(new SplashScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialPageRoute.debugEnableFadingRoutes = true; // todo REMOVE THIS!!!
    return new MaterialApp(
        title: 'Georgia On My Dime',
        theme: _appTheme(),
        home: new SplashWidget());
  }

  ThemeData _appTheme() {
    return new ThemeData(
      fontFamily: 'Quicksand',
      // This is the theme of your application.
      primarySwatch: Colors.blue,
    );
  }
}

class SplashWidget extends StatelessWidget {
  void startApplication(BuildContext context) {
    Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => MainPagerScreen()));
  }

  startTime(BuildContext context) async {
    var _duration = new Duration(milliseconds: 1000);
    return new Timer(_duration, () => startApplication(context));
  }

  @override
  Widget build(BuildContext context) {
    startTime(context);
    return new Scaffold(
      backgroundColor: GeorgiaColors.dimeGray,
      body: new Center(
        child: Image.asset("assets/gomd_icon.png", height: 172.0),
      ),
    );
  }
}
