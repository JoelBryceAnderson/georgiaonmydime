import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/HappyHour.dart';
import 'package:georgiaonmydime/widgets/happyhour/BookmarkedIcon.dart';
import 'package:georgiaonmydime/widgets/happyhour/OpenStatusText.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(happyHour.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(top: 4.0, left: 12.0, bottom: 24.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(happyHour.title,
                              style: Theme.of(context).textTheme.title)),
                      new BookmarkedIcon(happyHour: happyHour)
                    ],
                  ),
                  new Container(
                      margin: new EdgeInsets.only(top: 4.0, right: 12.0),
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
                  new OpenStatusText(status: happyHour.openStatus)
                ]))
          ],
        ));
  }
}
