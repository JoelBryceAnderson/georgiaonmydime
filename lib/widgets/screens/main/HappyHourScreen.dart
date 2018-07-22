import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/remote/RemoteHappyHour.dart';
import 'package:georgiaonmydime/network/APIReceiver.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/AppBarBottom.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';
import 'package:http/http.dart' as http;

class HappyHourScreen extends StatelessWidget {
  const HappyHourScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  List<ListItem> buildList(List<RemoteHappyHour> posts) {
    return new List<ListItem>.generate(
      posts.length,
      (i) => new HappyHourItem(new HappyHour.fromRemote(posts[i])),
    );
  }

  FutureBuilder<List<RemoteHappyHour>> buildPostsFromServer() {
    return FutureBuilder<List<RemoteHappyHour>>(
      future: APIReceiver.happyHours(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CardList(items: buildList(snapshot.data))
            : SliverFillRemaining(
                child: new Center(child: new CircularProgressIndicator()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          expandedHeight: 164.0,
          pinned: true,
          leading: new Padding(
              padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Image.asset("assets/gomd_icon.png")),
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          centerTitle: true,
          title: new ImageIcon(new AssetImage("assets/gomd_title.png"),
              size: 184.0, color: Colors.white),
          flexibleSpace: new FlexibleSpaceBar(background: new AppBarBottom())),
      buildPostsFromServer()
    ]);
  }
}
