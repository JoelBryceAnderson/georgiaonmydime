// UI Object for Posts
class RemoteEvent {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String published;

  RemoteEvent(this.title, this.description, this.imageUrl, this.articleUrl,
      this.published);

  factory RemoteEvent.fromJson(Map<String, dynamic> json) {
    return RemoteEvent(
        json['title'] as String,
        json['description'] as String,
        json['imageUrl'] as String,
        json['articleUrl'] as String,
        json['published'] as String);
  }
}
