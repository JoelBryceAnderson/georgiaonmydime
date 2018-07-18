// UI Object for Posts
class Post {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String published;

  Post(this.title, this.description, this.imageUrl, this.articleUrl,
      this.published);

  static fromJson(json) {}
}
