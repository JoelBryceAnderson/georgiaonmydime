import 'package:georgiaonmydime/data/events/EventVenue.dart';

// UI Object for Event
class Event {
  final String title;
  final String description;
  final String imageUrl;
  final String directions;
  final String eventUrl;
  final String date;
  final String time;
  final String category;
  final List<String> tags;
  final EventVenue eventVenue;

  Event(
      this.title,
      this.description,
      this.imageUrl,
      this.directions,
      this.eventUrl,
      this.date,
      this.time,
      this.category,
      this.tags,
      this.eventVenue);
}
