import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:georgiaonmydime/data/HappyHour.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/OpenStatus.dart';
import 'package:georgiaonmydime/data/Weekday.dart';
import 'package:georgiaonmydime/widgets/HappyHourCard.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp(
        items: new List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? new HeadingItem("Heading $i")
          : new HappyHourItem(new HappyHour(
              Weekday.monday,
              "Torched Hop Brewing Company",
              "All Day: ​Every Tuesday the kitchen is whipping up 4 dollar sliders. The options include Pork Belly BLT, Super THC, Fried Avocado, and the SMCC Burger.",
              "https://georgiaonmydime.com/wp-content/uploads/2018/05/Torched-Hop-Brewing-Company-550x420.jpg",
              "Midtown",
              OpenStatus.open,
              false)),
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
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Georgia On My Dime",
              style: new TextStyle(color: Colors.white)),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is HeadingItem) {
                return new ListTile(
                  title: new Text(item.heading,
                      style: Theme.of(context).textTheme.headline),
                );
              } else if (item is HappyHourItem) {
                return new HappyHourCard(happyHour: item.happyHour);
              }
            }),
      ),
    );
  }
}
