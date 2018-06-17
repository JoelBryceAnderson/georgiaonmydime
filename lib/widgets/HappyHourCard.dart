import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/HappyHour.dart';
import 'package:meta/meta.dart';

class HappyHourCard extends StatelessWidget {
  HappyHourCard({Key key, @required this.happyHour}) : super(key: key);

  final HappyHour happyHour;

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin: new EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.network(happyHour.imageUrl),
            new Container(
              margin: new EdgeInsets.only(
                  top: 12.0, left: 12.0, right: 12.0, bottom: 24.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(happyHour.title,
                      style: Theme.of(context).textTheme.title),
                  new Container(
                      margin: new EdgeInsets.only(top: 12.0),
                      child: new Text(happyHour.description,
                          style: Theme.of(context).textTheme.body1))
                ],
              ),
            ),
            new Divider(height: 4.0, color: Colors.grey),
            new Container(
                margin: new EdgeInsets.all(12.0),
                child: new Row(children: <Widget>[
                  new Expanded(
                      child: new Text(happyHour.location,
                          style: Theme.of(context).textTheme.body1)),
                  new Text(happyHour.openStatus.toString(),
                      style: Theme.of(context).textTheme.body1)
                ]))
          ],
        ));
  }
}
