import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/OpenStatus.dart';

class OpenStatusText extends StatelessWidget {
  const OpenStatusText({Key key, this.status}) : super(key: key);

  final OpenStatus status;

  @override
  Widget build(BuildContext context) {
    return new Text(_getStatusString(),
        style: new TextStyle(color: _getTextColor()));
  }

  Color _getTextColor() {
    return status == OpenStatus.open ? Colors.green : Colors.red;
  }

  String _getStatusString() {
    return status == OpenStatus.open ? "Open" : "Closed";
  }
}
