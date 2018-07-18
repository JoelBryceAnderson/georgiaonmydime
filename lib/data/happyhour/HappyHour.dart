import 'package:georgiaonmydime/data/happyhour/OpenStatus.dart';
import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
import 'package:latlong/latlong.dart';

// UI Object for HappyHour
class HappyHour {
  final Weekday day;
  final String title;
  final String description;
  final String happyHourUrl;
  final String imageUrl;
  final String neighborhood;
  final OpenStatus openStatus;
  final LatLng latLng;

  bool saved;

  HappyHour(
      this.day,
      this.title,
      this.description,
      this.happyHourUrl,
      this.imageUrl,
      this.neighborhood,
      this.openStatus,
      this.latLng,
      this.saved);

  factory HappyHour.fromJson(Map<String, dynamic> json) {
    return HappyHour(
        Weekday.monday,
        json['title'] as String,
        json['description'] as String,
        json['happyHourUrl'] as String,
        json['imageUrl'] as String,
        json['neighborhood'] as String,
        json['openStatus'] as OpenStatus,
        json['latLng'] as LatLng,
        false);
  }
}
