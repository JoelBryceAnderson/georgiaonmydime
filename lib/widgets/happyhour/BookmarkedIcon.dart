import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';

class BookmarkedIcon extends StatefulWidget {
  const BookmarkedIcon({Key key, this.happyHour, this.outlineColor: Colors.black}) : super(key: key);

  final HappyHour happyHour;
  final Color outlineColor;

  @override
  State<StatefulWidget> createState() => new _BookmarkState(happyHour, outlineColor);
}

class _BookmarkState extends State<BookmarkedIcon> {
  _BookmarkState(this._happyHour, this._outlineColor);

  final HappyHour _happyHour;
  final Color _outlineColor;

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(
            _happyHour.saved ? Icons.favorite : Icons.favorite_border,
            color: _happyHour.saved ? Colors.red : _outlineColor),
        onPressed: _onClicked);
  }

  void _onClicked() {
    setState(() {
      _happyHour.saved = !_happyHour.saved;
    });
  }
}
