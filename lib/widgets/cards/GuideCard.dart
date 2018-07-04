import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/widgets/screens/detail/GuideDetailScreen.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({Key key, this.guide}) : super(key: key);

  final Guide guide;

  void _openDetail(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => GuideDetailScreen(guide: guide)));
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin:
            new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: new FlatButton(
            padding: new EdgeInsets.all(0.0),
            onPressed: () => _openDetail(context),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Image.network(guide.imageUrl,
                    height: 150.0, fit: BoxFit.fitWidth),
                new Container(
                  margin: new EdgeInsets.only(
                      top: 12.0, left: 12.0, right: 12.0, bottom: 16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(guide.title,
                          style: Theme.of(context).textTheme.title),
                      new Container(
                          margin: new EdgeInsets.only(top: 12.0),
                          child: new Text(guide.description,
                              style: Theme.of(context).textTheme.body1))
                    ],
                  ),
                ),
                new Divider(height: 4.0, color: Colors.grey),
                new Container(
                  margin: new EdgeInsets.all(12.0),
                  child: new Row(children: <Widget>[
                    new Container(
                        margin: new EdgeInsets.only(right: 4.0),
                        child: new Icon(
                          Icons.calendar_today,
                          color: Colors.black45,
                          size: 16.0,
                        )),
                    new Text(guide.published,
                        style: Theme.of(context).textTheme.body1)
                  ]),
                )
              ],
            )));
  }
}
