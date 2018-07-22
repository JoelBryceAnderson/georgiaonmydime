import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/posts/NewsArticle.dart';
import 'package:georgiaonmydime/data/remote/Post.dart';
import 'package:georgiaonmydime/network/APIReceiver.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;
  
  List<ListItem> buildList(List<Post> posts) {
    return new List<ListItem>.generate(
      posts.length,
      (i) => new NewsArticleItem(new NewsArticle(
          posts[i].title,
          posts[i].description,
          posts[i].imageUrl,
          posts[i].articleUrl,
          posts[i].published)),
    );
  }

  FutureBuilder<List<Post>> buildPostsFromServer() {
    return FutureBuilder<List<Post>>(
      future: APIReceiver.news(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CardList(items: buildList(snapshot.data))
            : SliverFillRemaining(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    buildPostsFromServer();
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          floating: true,
          titleSpacing: 0.0,
          leading: new Padding(
              padding: new EdgeInsets.all(12.0),
              child: Image.asset("assets/gomd_icon.png")),
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          title: new Text("News",
              style: new TextStyle(color: Colors.white, fontSize: 24.0))),
      buildPostsFromServer()
    ]);
  }
}
