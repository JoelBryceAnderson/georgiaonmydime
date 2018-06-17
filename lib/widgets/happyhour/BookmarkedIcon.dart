import 'package:flutter/material.dart';

class BookmarkedIcon extends StatelessWidget {
  const BookmarkedIcon({Key key, this.saved}) : super(key: key);

  final bool saved;

  @override
  Widget build(BuildContext context) {
    return new Icon(saved ? Icons.bookmark : Icons.bookmark_border,
        color: Colors.blueAccent);
  }
}
