import 'package:georgiaonmydime/data/happyhour/OpenStatus.dart';
import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
import 'package:latlong/latlong.dart';

// UI Object for HappyHour
class HappyHour {
  final Weekday day;
  final String title;
  final String description;
  final String imageUrl;
  final String neighborhood;
  final LatLng latLng;
  final OpenStatus openStatus;

  bool saved;

  HappyHour(this.day, this.title, this.description, this.imageUrl,
      this.neighborhood, this.openStatus, this.latLng, this.saved);
}
