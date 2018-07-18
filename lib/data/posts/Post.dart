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
        json['title'] as String,
        json['description'] as String,
        json['imageUrl'] as String,
        json['articleUrl'] as String,
        json['published'] as String);
  }
}
