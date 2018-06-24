import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/AboutList.dart';
import 'package:share/share.dart';

class HappyHourDetailScreen extends StatelessWidget {
  const HappyHourDetailScreen({Key key, this.happyHour}) : super(key: key);

  final HappyHour happyHour;

  List<ListItem> generateAboutList(BuildContext context) {
    var list = new List<ListItem>();

    list.add(new HeadingItem(happyHour.title));
    list.add(new AboutDescriptionItem(happyHour.description, ""));
    return list;
  }

  void shareArticle(BuildContext context) {
    Share.share(happyHour.happyHourUrl);
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
    return new AboutList(items: generateAboutList(context));
  }

  Widget buildAppBarSliver(BuildContext context) {
    return new SliverAppBar(
        pinned: false,
        floating: false,
        backgroundColor: GeorgiaColors.ceruleanBlue,
        expandedHeight: 190.0,
        actions: <Widget>[
          new IconButton(
              color: Colors.white,
              icon: new Icon(Icons.share),
              onPressed: () => shareArticle(context))
        ],
        flexibleSpace: new FlexibleSpaceBar(
            background:
                new Image.network(happyHour.imageUrl, fit: BoxFit.cover)),
        leading: new IconButton(
            color: Colors.white,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
