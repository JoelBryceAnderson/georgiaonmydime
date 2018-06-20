import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:georgiaonmydime/widgets/navigation/AppBarBottom.dart';
import 'package:georgiaonmydime/widgets/screens/main/EventsScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/GuideScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/HappyHourScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/NewsScreen.dart';

void main() => runApp(new MainApp());

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => new _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Georgia On My Dime',
        theme: _appTheme(),
        home: new Scaffold(
          body: _buildPageView(),
          bottomNavigationBar: _buildBottomBar(),
        ));
  }

  ThemeData _appTheme() {
    return new ThemeData(
      fontFamily: 'Quicksand',
      // This is the theme of your application.
      primarySwatch: Colors.grey,
    );
  }

  Widget _buildPageView() {
    return new PageView(
        children: <Widget>[
          new HappyHourScreen(),
          new GuideScreen(),
          new NewsScreen(),
          new EventsScreen()
        ],
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: new NeverScrollableScrollPhysics());
  }

  Widget _buildBottomBar() {
    return new BottomNavigationBar(
        currentIndex: _page,
        items: [
          _generateNavItem(Icons.local_bar, "Happy Hours"),
          _generateNavItem(Icons.book, "Guides"),
          _generateNavItem(Icons.library_books, "News"),
          _generateNavItem(Icons.calendar_today, "Events")
        ],
        type: BottomNavigationBarType.fixed,
        onTap: _navigationTapped,
        fixedColor: Colors.blueAccent);
  }

  BottomNavigationBarItem _generateNavItem(IconData icon, String title) {
    return new BottomNavigationBarItem(
        icon: new Icon(icon), title: new Text(title));
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
