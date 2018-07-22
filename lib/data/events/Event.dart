import 'package:georgiaonmydime/data/events/EventVenue.dart';
import 'package:georgiaonmydime/data/remote/RemoteEvent.dart';

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

  factory Event.fromRemote(RemoteEvent remote) {
    //todo
    return Event(
      remote.published,
      remote.published,
      remote.published,
      remote.published,
      remote.published,
      remote.published,
      remote.published,
      remote.published,
      new List(),
      EventVenue("", "", ""),
    );
  }
}
