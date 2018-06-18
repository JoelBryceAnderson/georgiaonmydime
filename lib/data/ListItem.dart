import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';

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
