import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/widgets/navigation/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/AppBarBottom.dart';
import 'package:georgiaonmydime/widgets/navigation/AppNavigationBar.dart';

class HappyHourScreen extends StatelessWidget {
  const HappyHourScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: new ImageIcon(new AssetImage("assets/gomd_title.png"),
              size: 184.0, color: Colors.white),
          bottom: new PreferredSize(
            child: new AppBarBottom(),
            preferredSize: const Size.fromHeight(80.0),
          )),
      body: new CardList(items: items),
      bottomNavigationBar: new AppNavigationBar(),
    );
  }
}
