import 'package:georgiaonmydime/data/OpenStatus.dart';
import 'package:georgiaonmydime/data/Weekday.dart';

// UI Object for HappyHour
class HappyHour {
  final Weekday day;
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final OpenStatus openStatus;

  bool saved;

  HappyHour(this.day, this.title, this.description, this.imageUrl,
      this.location, this.openStatus, this.saved);
}
