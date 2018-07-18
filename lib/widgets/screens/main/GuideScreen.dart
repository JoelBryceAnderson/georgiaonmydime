import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/posts/Guide.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  static List<ListItem> _generateMocksList() {
    return new List<ListItem>.generate(
      15,
      (i) => new GuideItem(new Guide(
          "Best Bars to Watch Atlanta United Matches",
          "As we all know, being an Atlanta sports fan can be pretty depressing. After a heartbreaking Super Bowl loss for the Falcons followed by a Georgia Bulldawgs loss in the Nation Championship (played in Atlanta, of course), it seems like the ATL isn’t much of a football town. Lucky for us, there is a third football team that calls Georgia its home.",
          "https://georgiaonmydime.com/wp-content/uploads/2018/03/atlanta-united-bars-372x240.jpg",
          "https://georgiaonmydime.com/best-bars-to-watch-atlanta-united-matches/",
          "April 23, 2018")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          floating: true,
          titleSpacing: 0.0,
          leading: new Padding(
              padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Image.asset("assets/gomd_icon.png")),
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          title: new Text("Guides",
              style: new TextStyle(color: Colors.white, fontSize: 24.0))),
      CardList(items: _generateMocksList())
    ]);
  }
}
