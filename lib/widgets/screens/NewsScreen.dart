import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/widgets/lists/NewsArticleList.dart';
import 'package:georgiaonmydime/widgets/navigation/AppNavigationBar.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: new ImageIcon(new AssetImage("assets/gomd_title.png"),
            size: 184.0, color: Colors.white),
      ),
      body: new NewsArticleList(items: items),
      bottomNavigationBar: new AppNavigationBar(),
    );
  }
}
