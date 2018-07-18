import 'package:georgiaonmydime/data/events/EventVenue.dart';

// UI Object for Event
class Event {
  final String title;
  final String description;
  final String imageUrl;
  final String eventUrl;
  final String directions;
  final String date;
  final String time;
  final String category;
  final List<String> tags;
  final EventVenue eventVenue;

  Event(
      this.title,
      this.description,
      this.imageUrl,
      this.eventUrl,
      this.directions,
      this.date,
      this.time,
      this.category,
      this.tags,
      this.eventVenue);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      json['title'] as String,
      json['description'] as String,
      json['imageUrl'] as String,
      json['eventUrl'] as String,
      json['directions'] as String,
      json['date'] as String,
      json['time'] as String,
      json['category'] as String,
      json['tags'] as List<String>,
      EventVenue("", "", ""),
    );
  }
}
