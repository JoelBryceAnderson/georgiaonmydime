import 'package:flutter/material.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/screens/main/MainPagerScreen.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialPageRoute.debugEnableFadingRoutes = true; // todo REMOVE THIS!!!
    return new MaterialApp(
        title: 'Georgia On My Dime',
        theme: _appTheme(),
        home: new SplashScreen());
  }

  ThemeData _appTheme() {
    return new ThemeData(
      fontFamily: 'Quicksand',
      // This is the theme of your application.
      primarySwatch: Colors.blue,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
        duration: Duration(milliseconds: 700), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (context) => new MainPagerScreen()));
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: GeorgiaColors.dimeGray,
      body: new Center(
        child: Image.asset("assets/gomd_icon.png", height: 172.0),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
