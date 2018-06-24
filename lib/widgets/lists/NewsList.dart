import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  State<StatefulWidget> createState() => new _NewsListState(items);
}

class _NewsListState extends State<NewsList> {
  _NewsListState(this.items);

  final List<ListItem> items;

  Widget getWidgetFromIndex(int index) {
    final item = items[index];

    if (item is HeadingItem) {
      return buildHeader(item);
    } else if (item is BodyItem) {
      return buildDescription(item);
    } else if (item is ButtonItem) {
      return buildButton(item);
    }

    return new ListTile(
        title: new Text("Error", style: Theme.of(context).textTheme.headline));
  }

  Widget buildButton(ButtonItem item) {
    return new ListTile(
        title: new Padding(
            padding: new EdgeInsets.only(left: 12.0, right: 12.0),
            child: new MaterialButton(
                padding: new EdgeInsets.all(8.0),
                onPressed: item.onPressed,
                child: new Text(item.content,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 18.0)),
                color: GeorgiaColors.ceruleanBlue,
                textColor: Colors.white)));
  }

  Widget buildHeader(HeadingItem item) {
    return new ListTile(
        title: new Padding(
            padding: new EdgeInsets.only(top: 24.0),
            child: new Text(item.heading,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold))));
  }

  Widget buildDescription(BodyItem item) {
    return new ListTile(
        title: new Container(
            child: new Column(
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.only(top: 12.0),
                    child: new Text(item.body,
                        style:
                            new TextStyle(fontSize: 14.0, color: Colors.black)))
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
