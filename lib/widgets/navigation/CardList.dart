import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/widgets/cards/GuideCard.dart';
import 'package:georgiaonmydime/widgets/cards/HappyHourCard.dart';
import 'package:georgiaonmydime/widgets/cards/NewsArticleCard.dart';

class CardList extends StatefulWidget {
  const CardList({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  State<StatefulWidget> createState() => new _CardListState(items);
}

class _CardListState extends State<CardList> {
  _CardListState(this.items);

  final List<ListItem> items;

  Widget getWidgetFromIndex(int index) {
    final item = items[index];

    if (item is HeadingItem) {
      return new ListTile(
        title:
            new Text(item.heading, style: Theme.of(context).textTheme.headline),
      );
    } else if (item is NewsArticleItem) {
      return new NewsArticleCard(newsArticle: item.newsArticle);
    } else if (item is HappyHourItem) {
      return new HappyHourCard(happyHour: item.happyHour);
    } else if (item is GuideItem) {
      return new GuideCard(guide: item.guide);
    } else if (item is EventCalendarItem) {
      return new Calendar(onDateSelected: item.onDateChanged);
    }
    return new ListTile(
        title: new Text("Error", style: Theme.of(context).textTheme.headline));
  }

  @override
  Widget build(BuildContext context) {
    return new SliverList(
        delegate: new SliverChildBuilderDelegate(
            (context, index) => getWidgetFromIndex(index),
            childCount: items.length));
  }
}
