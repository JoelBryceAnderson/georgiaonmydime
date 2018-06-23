import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/AboutList.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;
  static String aboutDesc1 =
      "Georgia on my Dime is Atlanta’s number one site for up-to-date happy hour specials, upcoming events, and local guides. Whether you’re an Atlanta native or new to the city, you’ll be sure to discover great deals and local events!\n\nWe work hard to ensure all of our information is current and accurate. If you notice an error, please let us know, and we will correct it as soon as possible.\n\nIf you are a local business owner and would like to promote your event or restaurant, get in touch with us below and we will get back to you promptly.\n\nCheers!";
  static String aboutDesc2 = "-Georgia on my Dime";
  static String valueDesc1 = "By Atlantans, for Atlantans. We love sharing the things that make our city so unique.";
  static String valueDesc2 = "Our list of Happy Hours and deals in Atlanta ensures that you can have a blast - without breaking the bank.";
  static String valueDesc3 = "We showcase the best Atlanta has to offer. If we don't have something positive to say, we won't say it at all.";
  static String valueDesc4 = "Our list of deals and Happy Hours is always growing. Check it out today!";

  static List<ListItem> generateAboutList() {
    var list = new List<ListItem>();

    list.add(new AboutHeaderItem("About Us"));
    list.add(new AboutDescriptionItem(aboutDesc1, aboutDesc2));
    list.add(new AboutHeaderItem("Our Values"));
    list.add(new AboutValueItem(valueDesc1));
    list.add(new AboutValueItem(valueDesc2));
    list.add(new AboutValueItem(valueDesc3));
    list.add(new AboutValueItem(valueDesc4));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new CustomScrollView(slivers: <Widget>[
      buildAppBarSliver(context),
      buildAboutBodySliver(context)
    ]));
  }

  Widget buildAboutBodySliver(BuildContext context) {
    return new AboutList(items: generateAboutList());
  }

  Widget buildAppBarSliver(BuildContext context) {
    return new SliverAppBar(
        pinned: false,
        floating: true,
        backgroundColor: GeorgiaColors.ceruleanBlue,
        expandedHeight: 190.0,
        flexibleSpace: new FlexibleSpaceBar(
            background: new Image.network(
                "https://georgiaonmydime.com/wp-content/uploads/2018/05/Thrive-Happy-Hour.jpg",
                fit: BoxFit.cover)),
        leading: new IconButton(
            color: Colors.white,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
