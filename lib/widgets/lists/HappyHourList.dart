import 'package:flutter/material.dart';
import 'package:georgiaonmydime/data/ListItem.dart';
import 'package:georgiaonmydime/widgets/happyhour/HappyHourCard.dart';

class HappyHourList extends StatelessWidget {
  const HappyHourList({Key key, this.items}) : super(key: key);

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
          } else if (item is HappyHourItem) {
            return new HappyHourCard(happyHour: item.happyHour);
          }
        });
  }
}
