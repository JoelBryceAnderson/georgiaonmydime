// UI Object for News Article
import 'package:georgiaonmydime/data/remote/Post.dart';

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String published;

  NewsArticle(this.title, this.description, this.imageUrl, this.articleUrl,
      this.published);

  factory NewsArticle.fromRemote(Post remote) {
    return NewsArticle(
        remote.title,
        remote.description,
        "https://georgiaonmydime.com/wp-content/uploads/2018/05/Torched-Hop-Brewing-Company-550x420.jpg",
        remote.articleUrl,
        remote.published);
  }
}
