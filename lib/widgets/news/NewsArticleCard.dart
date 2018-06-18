import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({Key key, this.newsArticle}) : super(key: key);

  final NewsArticle newsArticle;

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin: new EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(newsArticle.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(top: 4.0, left: 12.0, bottom: 24.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(newsArticle.title,
                      style: Theme.of(context).textTheme.title),
                  new Container(
                      margin: new EdgeInsets.only(top: 4.0, right: 12.0),
                      child: new Text(newsArticle.description,
                          style: Theme.of(context).textTheme.body1))
                ],
              ),
            ),
            new Divider(height: 4.0, color: Colors.grey),
            new Container(
                margin: new EdgeInsets.all(12.0),
                child: new Text(newsArticle.published.toString()))
          ],
        ));
  }
}