import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:url_launcher/url_launcher.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key key, this.event}) : super(key: key);

  final Event event;

  void _openLink() {
    launch(event.eventUrl);
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin: new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(event.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(event.title,
                      style: Theme.of(context).textTheme.title),
                  new Container(
                      margin: new EdgeInsets.only(top: 12.0),
                      child: new Text(event.description,
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
