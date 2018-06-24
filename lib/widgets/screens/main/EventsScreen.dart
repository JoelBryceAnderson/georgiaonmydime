import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:georgiaonmydime/data/events/EventVenue.dart';
import 'package:georgiaonmydime/theme/GeorgiaColors.dart';
import 'package:georgiaonmydime/widgets/lists/CardList.dart';
import 'package:georgiaonmydime/widgets/navigation/MenuAction.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  State<StatefulWidget> createState() => new _EventState(items);
}

class _EventState extends State<EventsScreen> {
  _EventState(this._items);

  final List<ListItem> _items;
  DateTime _date;

  List<ListItem> _generateMocksList() {
    return new List<ListItem>.generate(15, (i) => createListItem(i));
  }

  ListItem createListItem(int index) {
    switch (index) {
      case 0:
        return new EventCalendarItem(_onDateChanged());
        break;
      case 1:
        return new HeadingItem("Date Here");
        break;
      default:
        return new EventItem(new Event(
            "Piedmont Park Farmers Market",
            "The Green Market returns on March 24th, 2018 in Piedmont Park and we cannot wait! Wake up Saturday morning to Piedmont Park’s Green Market, a local farmers market serving Midtown’s population with fresh, clean and local food. ",
            "https://georgiaonmydime.com/wp-content/uploads/2018/03/00000IMG_00000_BURST20180324120705874_COVER-e1524523804151-300x157.jpg",
            "https://georgiaonmydime.com/event/piedmont-park-farmers-market/",
            "",
            "June 23",
            "9:00 am - 1:00 pm",
            "Farmers Market",
            new List(),
            new EventVenue("Piedmont Park", "",
                "400 Park Dr NE ATLANTA, GA 30309 United States")));
        break;
    }
  }

  ValueChanged<DateTime> _onDateChanged() {
    return (dateTime) => _onNewDateSet(dateTime);
  }

  void _onNewDateSet(DateTime dateTime) {
    setState(() {
      _date = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(slivers: <Widget>[
      new SliverAppBar(
          floating: true,
          titleSpacing: 0.0,
          leading: new Padding(
              padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Image.asset("assets/gomd_icon.png")),
          actions: <Widget>[new MenuAction()],
          backgroundColor: GeorgiaColors.ceruleanBlue,
          title: new Text("Events",
              style: new TextStyle(color: Colors.white, fontSize: 24.0))),
      CardList(items: _generateMocksList())
    ]);
  }
}
