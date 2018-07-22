import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/posts/Guide.dart';
import 'package:georgiaonmydime/data/remote/Post.dart';
import 'package:georgiaonmydime/network/APIReceiver.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';
import 'package:http/http.dart' as http;

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  List<ListItem> buildList(List<Post> posts) {
    return new List<ListItem>.generate(
      posts.length,
      (i) => new GuideItem(new Guide(posts[i].title, posts[i].description,
          posts[i].imageUrl, posts[i].articleUrl, posts[i].published)),
    );
  }

  FutureBuilder<List<Post>> buildPostsFromServer() {
    return FutureBuilder<List<Post>>(
      future: APIReceiver.guides(http.Client()),
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
          floating: true,
          titleSpacing: 0.0,
          leading: new Padding(
              padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Image.asset("assets/gomd_icon.png")),
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          title: new Text("Guides",
              style: new TextStyle(color: Colors.white, fontSize: 24.0))),
      buildPostsFromServer()
    ]);
  }
}
