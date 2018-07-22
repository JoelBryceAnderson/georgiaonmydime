// UI Object for Posts
class RemoteHappyHour {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String published;

  RemoteHappyHour(this.title, this.description, this.imageUrl, this.articleUrl,
      this.published);

  factory RemoteHappyHour.fromJson(Map<String, dynamic> json) {
    return RemoteHappyHour(
        json['title'] as String,
        json['description'] as String,
        json['imageUrl'] as String,
        json['articleUrl'] as String,
        json['published'] as String);
  }
}
