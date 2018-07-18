import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:georgiaonmydime/data/events/Event.dart';
import 'package:georgiaonmydime/data/happyhour/HappyHour.dart';
import 'package:georgiaonmydime/data/posts/Post.dart';
import 'package:georgiaonmydime/network/APIService.dart';
import 'package:http/http.dart' as http;

class APIReceiver {
  APIService service;

  //region posts
  List<Post> parsePosts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Post>> posts(http.Client client) async {
    final response = await service.fetchPosts(client);

    return compute(parsePosts, response.body);
  }

  //endregion posts

  //region happy hour
  List<HappyHour> parseHappyHour(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<HappyHour>((json) => HappyHour.fromJson(json)).toList();
  }

  Future<List<HappyHour>> happyHours(http.Client client) async {
    final response = await service.fetchHappyHours(client);

    return compute(parseHappyHour, response.body);
  }

  //endregion happy hour

  //region events
  List<Event> parseEvent(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }

  Future<List<Event>> events(http.Client client) async {
    final response = await service.fetchHappyHours(client);

    return compute(parseEvent, response.body);
  }
//endregion events

}
