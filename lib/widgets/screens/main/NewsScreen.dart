import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/navigation/CardList.dart';
import 'package:georgiaonmydime/widgets/settings/MenuAction.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  static List<ListItem> _generateMocksList() {
    return new List<ListItem>.generate(
      15,
      (i) => new NewsArticleItem(new NewsArticle(
          "Publico Kitchen & Tap Now Open in Midtown",
          "Midtown, Atlanta just got a trendy, new restaurant off of Crescent Street! Publico Kitchen & Tap is now open in the old Front Page News Spot.",
          "https://georgiaonmydime.com/wp-content/uploads/2018/06/Publico-Atlanta-372x240.jpg",
          "https://georgiaonmydime.com/publico-kitchen-tap-now-open-in-midtown/",
          DateTime.now())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          floating: true,
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          title: new Text("News",
              style: new TextStyle(color: Colors.white, fontSize: 24.0))),
      CardList(items: _generateMocksList())
    ]);
  }
}
