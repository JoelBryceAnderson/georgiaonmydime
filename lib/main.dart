import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/HappyHour.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/OpenStatus.dart';
import 'package:georgiaonmydime/data/Weekday.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp(
        items: new List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? new HeadingItem("Heading $i")
          : new HappyHourItem(new HappyHour(
              Weekday.monday,
              "Happy Hour $i",
              "Description $i",
              "https://i.imgur.com/TH0noM3.jpg",
              "Buckhead",
              OpenStatus.closed,
              false)),
    )));

class MyApp extends StatelessWidget {
  MyApp({Key key, @required this.items}) : super(key: key);

  final List<ListItem> items;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Georgia On My Dime',
      theme: new ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.grey,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Georgia On My Dime",
              style: new TextStyle(color: Colors.white)),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is HeadingItem) {
                return new ListTile(
                  title: new Text(item.heading,
                      style: Theme.of(context).textTheme.headline),
                );
              } else if (item is HappyHourItem) {
                return new Card(
                    elevation: 4.0,
                    margin: new EdgeInsets.all(16.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.network(item.happyHour.imageUrl),
                        new Text(item.happyHour.title,
                            style: Theme.of(context).textTheme.title),
                        new Text(item.happyHour.description,
                            style: Theme.of(context).textTheme.body1),
                        new Text(item.happyHour.location,
                            style: Theme.of(context).textTheme.body1),
                        new Text(item.happyHour.day.toString(),
                            style: Theme.of(context).textTheme.body1)
                      ],
                    ));
              }
            }),
      ),
    );
  }
}
