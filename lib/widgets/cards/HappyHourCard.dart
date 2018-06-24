import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/widgets/happyhour/BookmarkedIcon.dart';
import 'package:georgiaonmydime/widgets/happyhour/OpenStatusText.dart';
import 'package:georgiaonmydime/widgets/screens/detail/HappyHourDetailScreen.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

class HappyHourCard extends StatelessWidget {
  HappyHourCard({Key key, @required this.happyHour}) : super(key: key);

  final HappyHour happyHour;

  _launchMaps() async {
    String androidURL = 'http://maps.google.com/maps?q=loc:${happyHour.latLng
        .latitude},'
        '${happyHour.latLng.longitude}(${happyHour.title})';
    String googleUrl = 'comgooglemaps://?center=${happyHour.latLng.latitude},'
        '${happyHour.latLng.longitude}';
    String appleUrl = 'https://maps.apple.com/?sll=${happyHour.latLng.latitude}'
        ',${happyHour.latLng.longitude}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(androidURL)) {
      await launch(androidURL);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _openDetailScreen(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => HappyHourDetailScreen(happyHour: happyHour)));
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin:
            new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: new FlatButton(
            padding: new EdgeInsets.all(0.0),
            onPressed: () => _openDetailScreen(context),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Image.network(happyHour.imageUrl,
                    height: 150.0, fit: BoxFit.fitWidth),
                new Container(
                  margin:
                      new EdgeInsets.only(top: 4.0, left: 12.0, bottom: 24.0),
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
                    margin: new EdgeInsets.only(
                        right: 12.0, bottom: 8.0, left: 12.0),
                    child: new Row(children: <Widget>[
                      new Expanded(
                          child: new FlatButton(
                              padding: new EdgeInsets.all(0.0),
                              onPressed: _launchMaps,
                              child: new Row(children: <Widget>[
                                new Container(
                                    margin: new EdgeInsets.only(right: 4.0),
                                    child: new Icon(
                                      Icons.place,
                                      color: Colors.black45,
                                      size: 16.0,
                                    )),
                                new Text(happyHour.neighborhood,
                                    style: Theme.of(context).textTheme.body1)
                              ]))),
                      new OpenStatusText(status: happyHour.openStatus)
                    ]))
              ],
            )));
  }
}
