import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';

class BookmarkedIcon extends StatefulWidget {
  const BookmarkedIcon({Key key, this.happyHour}) : super(key: key);

  final HappyHour happyHour;

  @override
  State<StatefulWidget> createState() => new _BookmarkState(happyHour);
}

class _BookmarkState extends State<BookmarkedIcon> {
  _BookmarkState(this._happyHour);

  final HappyHour _happyHour;

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(
            _happyHour.saved ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.blueAccent),
        onPressed: _onClicked);
  }

  void _onClicked() {
    setState(() {
      _happyHour.saved = !_happyHour.saved;
    });
  }
}
