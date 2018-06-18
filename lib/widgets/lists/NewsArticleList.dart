import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/widgets/happyhour/HappyHourCard.dart';
import 'package:georgiaonmydime/widgets/news/NewsArticleCard.dart';

class NewsArticleList extends StatefulWidget {
  const NewsArticleList({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  State<StatefulWidget> createState() => new _NewsArticleFeedState(items);
}

class _NewsArticleFeedState extends State<NewsArticleList> {
  _NewsArticleFeedState(this.items);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return new ListTile(
              title: new Text(item.heading,
                  style: Theme.of(context).textTheme.headline),
            );
          } else if (item is NewsArticleItem) {
            return new NewsArticleCard(newsArticle: item.newsArticle);
          }
        });
  }
}
