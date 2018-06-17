// Class to select filter on happy hour feed
class Filter {

  //open now
  final bool isOpen;

  //sorting
  final SortBy sortBy;

  //day of week
  final Weekday weekday;

  //distance
  final bool nearMe;
  final int distanceMiles;

  Filter(this.isOpen, this.sortBy, this.weekday, this.nearMe, this.distanceMiles);
}

enum SortBy {
  mostViewed
}

enum Weekday {
  monday, tuesday, wednesday, thursday, friday, saturday, sunday
}