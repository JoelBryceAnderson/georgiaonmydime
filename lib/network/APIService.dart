import 'dart:async';

import 'package:http/http.dart' as http;

class APIService {
  Future<http.Response> fetchPosts(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/wp/v2/posts');
  }

  Future<http.Response> fetchHappyHours(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/wp/v2/listing');
  }

  Future<http.Response> fetchEvents(http.Client client) {
    return client.get('https://georgiaonmydime.com/wp-json/tribe/events/v1/events');
  }
}
