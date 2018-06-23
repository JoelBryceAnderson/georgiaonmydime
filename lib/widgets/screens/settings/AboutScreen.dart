import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/navigation/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;
  final String aboutDesc1 =
      "Georgia on my Dime is Atlanta’s number one site for up-to-date happy hour specials, upcoming events, and local guides. Whether you’re an Atlanta native or new to the city, you’ll be sure to discover great deals and local events!\n\nWe work hard to ensure all of our information is current and accurate. If you notice an error, please let us know, and we will correct it as soon as possible.\n\nIf you are a local business owner and would like to promote your event or restaurant, get in touch with us below and we will get back to you promptly.\n\nCheers!";
  final String aboutDesc2 = "-Georgia on my Dime";

  static List<ListItem> _generateMocksList() {
    return new List<ListItem>.generate(
      15,
      (i) => new GuideItem(new Guide(
          "Best Bars to Watch Atlanta United Matches",
          "As we all know, being an Atlanta sports fan can be pretty depressing. After a heartbreaking Super Bowl loss for the Falcons followed by a Georgia Bulldawgs loss in the Nation Championship (played in Atlanta, of course), it seems like the ATL isn’t much of a football town. Lucky for us, there is a third football team that calls Georgia its home.",
          "https://georgiaonmydime.com/wp-content/uploads/2018/03/atlanta-united-bars-372x240.jpg",
          "https://georgiaonmydime.com/best-bars-to-watch-atlanta-united-matches/",
          DateTime.now())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new CustomScrollView(slivers: <Widget>[
      buildAppBarSliver(context),
      buildAboutBodySliver(context)
    ]));
  }

  Widget buildAboutBodySliver(BuildContext context) {
    return new SliverFillRemaining(
        child: new Container(
            padding: new EdgeInsets.only(
                top: 32.0, left: 16.0, right: 16.0, bottom: 32.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Padding(
                            padding:
                                new EdgeInsets.only(left: 24.0, right: 8.0),
                            child: new Divider(color: Colors.black))),
                    new Text("About Us",
                        style:
                            new TextStyle(color: Colors.black, fontSize: 24.0)),
                    new Expanded(
                        child: new Padding(
                            padding:
                                new EdgeInsets.only(left: 8.0, right: 24.0),
                            child: new Divider(color: Colors.black))),
                  ],
                ),
                new Padding(
                    padding: new EdgeInsets.only(top: 24.0),
                    child: new Text(
                      aboutDesc1,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 14.0, color: Colors.black),
                    )),
                new Padding(
                    padding: new EdgeInsets.only(top: 2.0, bottom: 64.0),
                    child: new Text(
                      aboutDesc2,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 18.0, color: Colors.black),
                    )),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Padding(
                            padding:
                                new EdgeInsets.only(left: 24.0, right: 8.0),
                            child: new Divider(color: Colors.black))),
                    new Text("Our Values",
                        style:
                            new TextStyle(color: Colors.black, fontSize: 24.0)),
                    new Expanded(
                        child: new Padding(
                            padding:
                                new EdgeInsets.only(left: 8.0, right: 24.0),
                            child: new Divider(color: Colors.black))),
                  ],
                ),
              ],
            )));
  }

  Widget buildAppBarSliver(BuildContext context) {
    return new SliverAppBar(
        pinned: false,
        floating: true,
        backgroundColor: GeorgiaColors.ceruleanBlue,
        expandedHeight: 190.0,
        flexibleSpace: new FlexibleSpaceBar(
            background: new Container(
                decoration: const BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://georgiaonmydime.com/wp-content/uploads/2018/05/Thrive-Happy-Hour.jpg"),
          ),
        ))),
        leading: new IconButton(
            color: Colors.white,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
