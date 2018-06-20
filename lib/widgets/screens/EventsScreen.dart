import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/widgets/navigation/CardList.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  State<StatefulWidget> createState() => new _EventState(items);
}

class _EventState extends State<EventsScreen> {
  _EventState(this.items);

  final List<ListItem> items;
  String day = "Today";

  List<ListItem> _generateMocksList() {
    return new List<ListItem>.generate(15, (i) => createListItem(i));
  }

  ListItem createListItem(int index) {
    switch (index) {
      case 0:
        return new EventCalendarItem(onDateChanged());
        break;
      case 1:
        return new HeadingItem(day);
        break;
      default:
        return new GuideItem(new Guide(
            "Best Bars to Watch Atlanta United Matches",
            "As we all know, being an Atlanta sports fan can be pretty depressing. After a heartbreaking Super Bowl loss for the Falcons followed by a Georgia Bulldawgs loss in the Nation Championship (played in Atlanta, of course), it seems like the ATL isn’t much of a football town. Lucky for us, there is a third football team that calls Georgia its home.",
            "https://georgiaonmydime.com/wp-content/uploads/2018/03/atlanta-united-bars-372x240.jpg",
            "https://georgiaonmydime.com/best-bars-to-watch-atlanta-united-matches/",
            DateTime.now()));
        break;
    }
  }

  ValueChanged<DateTime> onDateChanged() {
    return (dateTime) => onNewDateSet(dateTime);
  }

  void onNewDateSet(DateTime dateTime) {
    setState(() {
      day = dateTime.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          floating: true,
          backgroundColor: Colors.blueAccent,
          title: new Text("Events",
              style: new TextStyle(color: Colors.white, fontSize: 24.0))),
      CardList(items: _generateMocksList())
    ]);
  }
}
