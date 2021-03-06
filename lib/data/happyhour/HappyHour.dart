import 'package:georgiaonmydime/data/happyhour/OpenStatus.dart';
import 'package:georgiaonmydime/data/happyhour/Weekday.dart';
import 'package:georgiaonmydime/data/remote/RemoteHappyHour.dart';
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

  factory HappyHour.fromRemote(RemoteHappyHour remote) {
    //todo
    return HappyHour(
        Weekday.monday,
        remote.title,
        remote.description,
        remote.articleUrl,
        "https://georgiaonmydime.com/wp-content/uploads/2018/05/Torched-Hop-Brewing-Company-550x420.jpg",
        remote.title,
        OpenStatus.open,
        new LatLng(0.0, 0.0),
        false);
  }
}
