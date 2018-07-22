// UI Object for Posts
class Post {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String published;

  Post(this.title, this.description, this.imageUrl, this.articleUrl,
      this.published);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        json['status'] as String,
        json['status'] as String,
        json['type'] as String,
        json['link'] as String,
        json['date'] as String);
  }
}
