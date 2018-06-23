import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';

class AddHappyHourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
        titlePadding: new EdgeInsets.all(0.0),
        contentPadding: new EdgeInsets.all(0.0),
        children: <Widget>[
          new Image.network(
            "https://georgiaonmydime.com/wp-content/uploads/2018/05/The-Pinewood-Happy-Hours.jpg",
            height: 150.0,
            fit: BoxFit.cover,
          ),
          new Padding(
              padding: new EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: new Text("Check back soon!",
                  style: Theme.of(context).textTheme.title)),
          new Padding(
              padding: new EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 32.0),
              child: new Text(
                  "We're still working on this feature.\nIn the meantime, you can submit a happy hour online at:\n\nGeorgiaOnMyDime.com/submit-listing",
                  style: Theme.of(context).textTheme.body1)),
          new MaterialButton(
              padding: new EdgeInsets.all(8.0),
              color: GeorgiaColors.ceruleanBlue,
              onPressed: () => Navigator.pop(context),
              child: new Text("Close",
                  style: new TextStyle(color: Colors.white, fontSize: 18.0)))
        ]);
  }
}
