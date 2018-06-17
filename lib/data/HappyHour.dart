import 'package:georgiaonmydime/data/Filter.dart';

// UI Object for HappyHour
class HappyHour {

  final Weekday day;
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final String openStatus;

  final bool saved;

  HappyHour(this.day, this.title, this.description, this.imageUrl,
      this.location, this.openStatus, this.saved);
}
