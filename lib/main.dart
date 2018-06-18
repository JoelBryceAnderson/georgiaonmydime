import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/happyhour/OpenStatus.dart';
import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:georgiaonmydime/widgets/screens/HappyHourScreen.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp(
        items: new List<ListItem>.generate(
      15,
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

  List<ListItem> _generateNewsList() {
    return new List<ListItem>.generate(
      1,
      (i) => new NewsArticleItem(new NewsArticle(
          "Publico Kitchen & Tap Now Open in Midtown",
          "Midtown, Atlanta just got a trendy, new restaurant off of Crescent Street! Publico Kitchen & Tap is now open in the old Front Page News Spot.",
          "https://georgiaonmydime.com/wp-content/uploads/2018/06/Publico-Atlanta-372x240.jpg",
          "https://georgiaonmydime.com/publico-kitchen-tap-now-open-in-midtown/",
          DateTime.now())),
    );
  }

  List<ListItem> _generateGuideList() {
    return new List<ListItem>.generate(
      1,
      (i) => new GuideItem(new Guide(
          "Best Bars to Watch Atlanta United Matches",
          "As we all know, being an Atlanta sports fan can be pretty depressing. After a heartbreaking Super Bowl loss for the Falcons followed by a Georgia Bulldawgs loss in the Nation Championship (played in Atlanta, of course), it seems like the ATL isn’t much of a football town. Lucky for us, there is a third football team that calls Georgia its home.",
          "https://georgiaonmydime.com/wp-content/uploads/2018/03/atlanta-united-bars-372x240.jpg",
          "https://georgiaonmydime.com/best-bars-to-watch-atlanta-united-matches/",
          DateTime.now())),
    );
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
        home: new HappyHourScreen(
            items: _generateGuideList() + _generateNewsList() + items));
  }
}
