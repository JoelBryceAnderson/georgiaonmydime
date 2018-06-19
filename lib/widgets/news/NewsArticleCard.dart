import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({Key key, this.newsArticle}) : super(key: key);

  final NewsArticle newsArticle;

  void _openLink() {
    launch(newsArticle.articleUrl);
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin: new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(newsArticle.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(newsArticle.title,
                      style: Theme.of(context).textTheme.title),
                  new Container(
                      margin: new EdgeInsets.only(top: 12.0),
                      child: new Text(newsArticle.description,
                          style: Theme.of(context).textTheme.body1))
                ],
              ),
            ),
            new MaterialButton(
                padding: new EdgeInsets.all(8.0),
                onPressed: _openLink,
                child:
                    new Text("Read More", style: new TextStyle(fontSize: 18.0)),
                color: Colors.blueAccent,
                textColor: Colors.white)
          ],
        ));
  }
}
