import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/happyhour/OpenStatus.dart';
import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
import 'package:georgiaonmydime/widgets/screens/HappyHourScreen.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp(
        items: new List<ListItem>.generate(
      50,
      (i) => i % 6 == 0
          ? new HeadingItem("Monday")
          : new HappyHourItem(new HappyHour(
              Weekday.monday,
              "Torched Hop Brewing Company",
              "All Day: ​Every Tuesday the kitchen is whipping up 4 dollar sliders. The options include Pork Belly BLT, Super THC, Fried Avocado, and the SMCC Burger.",
              "https://georgiaonmydime.com/wp-content/uploads/2018/05/Torched-Hop-Brewing-Company-550x420.jpg",
              "Midtown",
              i % 2 == 0 ? OpenStatus.open : OpenStatus.closed,
              i % 2 == 0)),
    )));

class MyApp extends StatelessWidget {
  MyApp({Key key, @required this.items}) : super(key: key);

  final List<ListItem> items;

  void _setWindowProperties() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _setWindowProperties();
    return new MaterialApp(
        title: 'Georgia On My Dime',
        theme: new ThemeData(
          fontFamily: 'Quicksand',
          // This is the theme of your application.
          primarySwatch: Colors.grey,
        ),
        home: new HappyHourScreen(items: items));
  }
}
