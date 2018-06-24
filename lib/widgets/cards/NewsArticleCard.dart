import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/screens/detail/NewsDetailScreen.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({Key key, this.newsArticle}) : super(key: key);

  final NewsArticle newsArticle;

  void _openNewsArticle(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => NewsDetailScreen(article: newsArticle)));
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin:
            new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(newsArticle.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(
                  top: 12.0, left: 12.0, right: 12.0, bottom: 16.0),
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
                onPressed: () => _openNewsArticle(context),
                child:
                    new Text("Read More", style: new TextStyle(fontSize: 18.0)),
                color: GeorgiaColors.ceruleanBlue,
                textColor: Colors.white)
          ],
        ));
  }
}
