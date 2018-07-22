// UI Object for News Article
import 'package:georgiaonmydime/data/remote/Post.dart';

class Guide {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String published;

  Guide(this.title, this.description, this.imageUrl, this.articleUrl,
      this.published);

  factory Guide.fromRemote(Post remote) {
    return Guide(
        remote.title,
        remote.description,
        "https://georgiaonmydime.com/wp-content/uploads/2018/05/Torched-Hop-Brewing-Company-550x420.jpg",
        remote.articleUrl,
        remote.published);
  }
}
