import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({Key key, this.guide}) : super(key: key);

  final Guide guide;

  void _openLink() {}

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin: new EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(guide.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(top: 12.0, left: 12.0, bottom: 24.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(guide.title,
                      style: Theme.of(context).textTheme.title),
                  new Container(
                      margin: new EdgeInsets.only(top: 12.0, right: 12.0),
                      child: new Text(guide.description,
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
