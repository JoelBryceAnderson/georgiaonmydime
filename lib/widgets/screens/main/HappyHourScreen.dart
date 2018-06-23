import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/happyhour/OpenStatus.dart';
import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/navigation/AppBarBottom.dart';
import 'package:georgiaonmydime/widgets/navigation/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';
import 'package:latlong/latlong.dart';

class HappyHourScreen extends StatelessWidget {
  const HappyHourScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  static List<ListItem> _generateMocksList() {
    return new List<ListItem>.generate(
      15,
      (i) => i % 6 == 0
          ? new HeadingItem("Monday")
          : new HappyHourItem(new HappyHour(
              Weekday.monday,
              "Torched Hop Brewing Company",
              "All Day: ​Every Tuesday the kitchen is whipping up 4 dollar sliders. The options include Pork Belly BLT, Super THC, Fried Avocado, and the SMCC Burger.",
              "https://georgiaonmydime.com/atlanta-happy-hour/torched-hop-brewing-company/",
              "https://georgiaonmydime.com/wp-content/uploads/2018/05/Torched-Hop-Brewing-Company-550x420.jpg",
              "Midtown",
              i % 2 == 0 ? OpenStatus.open : OpenStatus.closed,
              new LatLng(33.7723, -84.3793),
              i % 2 == 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          expandedHeight: 164.0,
          pinned: true,
          leading: new Padding(
              padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Image.asset("assets/gomd_icon.png")),
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          centerTitle: true,
          title: new ImageIcon(new AssetImage("assets/gomd_title.png"),
              size: 184.0, color: Colors.white),
          flexibleSpace: new FlexibleSpaceBar(background: new AppBarBottom())),
      CardList(items: _generateMocksList())
    ]);
  }
}
