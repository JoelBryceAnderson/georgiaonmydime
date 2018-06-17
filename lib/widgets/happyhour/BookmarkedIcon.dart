import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/HappyHour.dart';

class BookmarkedIcon extends StatelessWidget {
  const BookmarkedIcon({Key key, this.happyHour}) : super(key: key);

  final HappyHour happyHour;

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(happyHour.saved ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.blueAccent),
        onPressed: _onClicked);
  }

  void _onClicked() {
    happyHour.saved = !happyHour.saved;
  }
}
