import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/screens/detail/EventsDetailScreen.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key key, this.event}) : super(key: key);

  final Event event;

  void _openEventDetail(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => EventDetailScreen(event: event)));
  }

  void _addToCalendar() {}

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4.0,
        margin:
            new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.network(event.imageUrl,
                height: 150.0, fit: BoxFit.fitWidth),
            new Container(
              margin: new EdgeInsets.only(
                  top: 12.0, left: 12.0, right: 12.0, bottom: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(event.title,
                      style: Theme.of(context).textTheme.title),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new FlatButton(
                              onPressed: _addToCalendar,
                              padding: new EdgeInsets.all(0.0),
                              child: new Row(children: <Widget>[
                                new Container(
                                    margin: new EdgeInsets.only(right: 4.0),
                                    child: new Icon(
                                      Icons.access_time,
                                      color: Colors.black45,
                                      size: 16.0,
                                    )),
                                new Text(event.time,
                                    style: Theme.of(context).textTheme.body1)
                              ]))),
                    ],
                  ),
                  new Container(
                      margin: new EdgeInsets.only(top: 4.0),
                      child: new Text(event.description,
                          style: Theme.of(context).textTheme.body1))
                ],
              ),
            ),
            new MaterialButton(
                padding: new EdgeInsets.all(8.0),
                onPressed: () => _openEventDetail(context),
                child:
                    new Text("Read More", style: new TextStyle(fontSize: 18.0)),
                color: GeorgiaColors.ceruleanBlue,
                textColor: Colors.white)
          ],
        ));
  }
}
