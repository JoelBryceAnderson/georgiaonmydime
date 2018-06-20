import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:georgiaonmydime/data/guides/Guide.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/news/NewsArticle.dart';

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a happy hour
class HappyHourItem implements ListItem {
  final HappyHour happyHour;

  HappyHourItem(this.happyHour);
}

class NewsArticleItem implements ListItem {
  final NewsArticle newsArticle;

  NewsArticleItem(this.newsArticle);
}

class GuideItem implements ListItem {
  final Guide guide;

  GuideItem(this.guide);
}

class EventItem implements ListItem {
  final Event event;

  EventItem(this.event);
}

class EventCalendarItem implements ListItem {
  final ValueChanged<DateTime> onDateChanged;

  EventCalendarItem(this.onDateChanged);
}
