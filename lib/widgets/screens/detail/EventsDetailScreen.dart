import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/NewsList.dart';
import 'package:share/share.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key key, this.event}) : super(key: key);

  final Event event;

  List<ListItem> generateAboutList(BuildContext context) {
    var list = new List<ListItem>();

    list.add(new HeadingItem(event.title));
    list.add(new DateItem(event.date));
    list.add(new BodyItem(event.description));
    return list;
  }

  void shareEvent(BuildContext context) {
    Share.share(event.eventUrl);
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
              onPressed: () => shareEvent(context))
        ],
        flexibleSpace: new FlexibleSpaceBar(
            background: new Image.network(event.imageUrl, fit: BoxFit.cover)),
        leading: new IconButton(
            color: Colors.white,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
