import 'dart:async';

import 'package:http/http.dart' as http;

class APIService {

  static Future<http.Response> fetchNews(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/wp/v2/posts?categories=15');
  }

  static Future<http.Response> fetchGuides(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/wp/v2/posts?categories=14');
  }

  static Future<http.Response> fetchHappyHours(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/wp/v2/listing');
  }

  static Future<http.Response> fetchEvents(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/tribe/events/v1/events');
  }
}
