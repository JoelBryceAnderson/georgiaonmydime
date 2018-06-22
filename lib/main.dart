import 'package:flutter/material.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/navigation/NavigationScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/EventsScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/GuideScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/HappyHourScreen.dart';
import 'package:georgiaonmydime/widgets/screens/main/NewsScreen.dart';

void main() => runApp(new MainApp());

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => new _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  List<NavigationScreen> _navigationViews;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Georgia On My Dime',
        theme: _appTheme(),
        home: new Scaffold(
          body: _buildTransitionsStack(),
          bottomNavigationBar: _buildBottomBar(),
        ));
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationScreen view in _navigationViews)
      transitions.add(view.transition(BottomNavigationBarType.fixed, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
  }

  ThemeData _appTheme() {
    return new ThemeData(
      fontFamily: 'Quicksand',
      // This is the theme of your application.
      primarySwatch: Colors.grey,
    );
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
        onTap: _onPageChanged,
        fixedColor: GeorgiaColors.ceruleanBlue);
  }

  BottomNavigationBarItem _generateNavItem(IconData icon, String title) {
    return new BottomNavigationBarItem(
        icon: new Icon(icon), title: new Text(title));
  }

  void _onPageChanged(int page) {
    setState(() {
      _navigationViews[_page].controller.reverse();
      _page = page;
      _navigationViews[_page].controller.forward();
    });
  }

  @override
  void initState() {
    super.initState();

    _navigationViews = <NavigationScreen>[
      new NavigationScreen(screen: new HappyHourScreen(), vsync: this),
      new NavigationScreen(screen: new GuideScreen(), vsync: this),
      new NavigationScreen(screen: new NewsScreen(), vsync: this),
      new NavigationScreen(screen: new EventsScreen(), vsync: this)
    ];

    for (NavigationScreen view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_page].controller.value = 1.0;
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }
}
