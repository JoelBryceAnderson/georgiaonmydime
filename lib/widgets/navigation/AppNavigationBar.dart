import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(items: [
      _generateNavItem(Icons.local_bar, "Happy Hours"),
      _generateNavItem(Icons.book, "Guides"),
      _generateNavItem(Icons.library_books, "News"),
      _generateNavItem(Icons.calendar_today, "Events")
    ], type: BottomNavigationBarType.fixed, fixedColor: Colors.blueAccent);
  }

  BottomNavigationBarItem _generateNavItem(IconData icon, String title) {
    return new BottomNavigationBarItem(icon: new Icon(icon), title: new Text(title));
  }
}


