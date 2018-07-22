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
        (json['title'] as Map<String, dynamic>)['rendered'] as String,
        json['link'] as String,
        (json['title'] as Map<String, dynamic>)['rendered'] as String,
        json['link'] as String,
        json['date'] as String);
  }
}
