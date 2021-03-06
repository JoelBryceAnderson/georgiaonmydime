import 'package:flutter/material.dart';

class AppBarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin:
            EdgeInsets.only(left: 88.0, right: 88.0, bottom: 12.0, top: 88.0),
        height: 80.0,
        child: new Column(
          children: <Widget>[
            new Text("Welcome, Joel",
                style: new TextStyle(fontSize: 18.0, color: Colors.white)),
            new Container(
                margin: EdgeInsets.only(top: 8.0),
                child: new Text("It's",
                    style: new TextStyle(color: Colors.white, fontSize: 12.0))),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 24.0, right: 8.0),
                        child: new Divider(color: Colors.white))),
                new Text(getDayOfWeek(),
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold)),
                new Expanded(
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 8.0, right: 24.0),
                        child: new Divider(color: Colors.white))),
              ],
            )
          ],
        ));
  }

  String getDayOfWeek() {
    switch (DateTime.now().weekday) {
      case 1:
        return "Monday";
        break;
      case 2:
        return "Tuesday";
        break;
      case 3:
        return "Wednesday";
        break;
      case 4:
        return "Thursday";
        break;
      case 5:
        return "Friday";
        break;
      case 6:
        return "Saturday";
        break;
      case 7:
        return "Sunday";
        break;
    }

    return "John Cena";
  }
}
