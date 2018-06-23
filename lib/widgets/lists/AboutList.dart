import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';

class AboutList extends StatefulWidget {
  const AboutList({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  State<StatefulWidget> createState() => new _AboutListState(items);
}

class _AboutListState extends State<AboutList> {
  _AboutListState(this.items);

  final List<ListItem> items;

  Widget getWidgetFromIndex(int index) {
    final item = items[index];

    if (item is AboutHeaderItem) {
      return buildHeader(item);
    } else if (item is AboutDescriptionItem) {
      return buildDescription(item);
    } else if (item is AboutValueItem) {
      return buildValue(item);
    } else if (item is AboutButtonItem) {
      return buildButton(item);
    }

    return new ListTile(
        title: new Text("Error", style: Theme.of(context).textTheme.headline));
  }

  Widget buildButton(AboutButtonItem item) {
    return new ListTile(
        title: new Padding(
            padding: new EdgeInsets.only(left: 24.0, right: 24.0),
            child: new MaterialButton(
                padding: new EdgeInsets.all(8.0),
                onPressed: item.onPressed,
                child: new Text(item.content,
                    style: new TextStyle(fontSize: 18.0)),
                color: GeorgiaColors.ceruleanBlue,
                textColor: Colors.white)));
  }

  Widget buildHeader(AboutHeaderItem item) {
    return new ListTile(
        title: new Padding(
            padding: new EdgeInsets.only(top: 24.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 24.0, right: 8.0),
                        child: new Divider(color: Colors.black))),
                new Text(item.content,
                    style: new TextStyle(color: Colors.black, fontSize: 24.0)),
                new Expanded(
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 8.0, right: 24.0),
                        child: new Divider(color: Colors.black))),
              ],
            )));
  }

  Widget buildDescription(AboutDescriptionItem item) {
    return new ListTile(
        title: new Container(
            padding: new EdgeInsets.only(left: 16.0, right: 16.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.only(top: 12.0),
                    child: new Text(
                      item.content1,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 14.0, color: Colors.black),
                    )),
                new Padding(
                    padding: new EdgeInsets.only(top: 2.0, bottom: 24.0),
                    child: new Text(
                      item.content2,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 18.0, color: Colors.black),
                    ))
              ],
            )));
  }

  Widget buildValue(AboutValueItem item) {
    return new ListTile(
        title: new Padding(
            padding: new EdgeInsets.only(
                top: 24.0, left: 80.0, right: 80.0, bottom: 12.0),
            child: new Column(
              children: <Widget>[
                new Image.asset(item.iconPath, height: 72.0),
                new Padding(
                    padding: new EdgeInsets.only(top: 8.0),
                    child: new Text(item.content,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 14.0, color: Colors.black))),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return new SliverList(
        delegate: new SliverChildBuilderDelegate(
            (context, index) => getWidgetFromIndex(index),
            childCount: items.length));
  }
}
