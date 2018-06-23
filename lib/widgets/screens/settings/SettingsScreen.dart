import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Scaffold(
            appBar: new AppBar(
              backgroundColor: GeorgiaColors.ceruleanBlue,
              leading: new IconButton(
                  color: Colors.white,
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
              title: new Text("Settings",
                  style: new TextStyle(
                    color: Colors.white,
                  )),
            ),
            body: new Center(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[new Text("Not yet implemented.")],
              ),
            )));
  }
}
