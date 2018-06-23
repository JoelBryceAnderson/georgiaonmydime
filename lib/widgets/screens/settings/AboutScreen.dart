import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/AboutList.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;
  final String aboutDesc1 =
      "Georgia on my Dime is Atlanta’s number one site for up-to-date happy hour specials, upcoming events, and local guides. Whether you’re an Atlanta native or new to the city, you’ll be sure to discover great deals and local events!\n\nWe work hard to ensure all of our information is current and accurate. If you notice an error, please let us know, and we will correct it as soon as possible.\n\nIf you are a local business owner and would like to promote your event or restaurant, get in touch with us below and we will get back to you promptly.\n\nCheers!";
  final String aboutDesc2 = "-Georgia on my Dime";
  final String valueDesc1 = "By Atlantans, for Atlantans. We love sharing the things that make our city so unique.";
  final String valueDesc2 = "Our list of Happy Hours and deals in Atlanta ensures that you can have a blast - without breaking the bank.";
  final String valueDesc3 = "We showcase the best Atlanta has to offer. If we don't have something positive to say, we won't say it at all.";
  final String valueDesc4 = "Our list of deals and Happy Hours is always growing. Check it out today!";

  List<ListItem> generateAboutList(BuildContext context) {
    var list = new List<ListItem>();
    final ios = (Theme.of(context).platform == TargetPlatform.iOS);
    var platform = ios ? "iOS" : "Android";

    list.add(new AboutHeaderItem("About Us"));
    list.add(new AboutDescriptionItem(aboutDesc1, aboutDesc2));
    list.add(new AboutButtonItem("Contact Us", () => launch("mailto:georgiaonmydime@gmail.com?subject=Georgia+On+My+Dime+Feedback+($platform)")));
    list.add(new AboutHeaderItem("Our Values"));
    list.add(new AboutValueItem(valueDesc1, "assets/gomd_icon.png"));
    list.add(new AboutValueItem(valueDesc2, "assets/gomd_icon.png"));
    list.add(new AboutValueItem(valueDesc3, "assets/gomd_icon.png"));
    list.add(new AboutValueItem(valueDesc4, "assets/gomd_icon.png"));

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
    return new AboutList(items: generateAboutList(context));
  }

  Widget buildAppBarSliver(BuildContext context) {
    return new SliverAppBar(
        pinned: false,
        floating: false,
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
