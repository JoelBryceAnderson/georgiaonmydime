import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/AboutList.dart';
import 'package:georgiaonmydime/widgets/lists/NewsList.dart';
import 'package:share/share.dart';

class GuideDetailScreen extends StatelessWidget {
  const GuideDetailScreen({Key key, this.guide}) : super(key: key);

  final Guide guide;

  List<ListItem> generateAboutList(BuildContext context) {
    var list = new List<ListItem>();

    list.add(new HeadingItem(guide.title));
    list.add(new BodyItem(guide.description));
    return list;
  }

  void shareArticle(BuildContext context) {
    Share.share(guide.articleUrl);
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
    return new NewsList(items: generateAboutList(context));
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
            background: new Image.network(guide.imageUrl, fit: BoxFit.cover)),
        leading: new IconButton(
            color: Colors.white,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
