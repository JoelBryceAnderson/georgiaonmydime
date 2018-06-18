import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
// Class to select filter on happy hour feed
class HappyHourFilter {

  //open now
  final bool isOpen;

  //sorting
  final SortBy sortBy;

  //day of week
  final Weekday weekday;

  //distance
  final bool nearMe;
  final int distanceMiles;

  HappyHourFilter(this.isOpen, this.sortBy, this.weekday, this.nearMe, this.distanceMiles);
}

enum SortBy {
  mostViewed
}