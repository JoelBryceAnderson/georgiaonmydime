import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:georgiaonmydime/data/posts/Guide.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/posts/NewsArticle.dart';

// The base class for the different types of items the List can contain
abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class BodyItem implements ListItem {
  final String body;

  BodyItem(this.body);
}

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

class ButtonItem implements ListItem {
  final String content;
  final VoidCallback onPressed;

  ButtonItem(this.content, this.onPressed);
}

class AboutDescriptionItem implements ListItem {
  final String content1;
  final String content2;

  AboutDescriptionItem(this.content1, this.content2);
}

class AboutValueItem implements ListItem {
  final String content;
  final String iconPath;

  AboutValueItem(this.content, this.iconPath);
}

class DateItem implements ListItem {
  final String date;

  DateItem(this.date);
}
