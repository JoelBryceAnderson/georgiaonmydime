import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:georgiaonmydime/data/remote/Post.dart';
import 'package:georgiaonmydime/data/remote/RemoteEvent.dart';
import 'package:georgiaonmydime/data/remote/RemoteHappyHour.dart';
import 'package:georgiaonmydime/network/APIService.dart';
import 'package:http/http.dart' as http;

class APIReceiver {
  //region guides
  static List<Post> parseGuides(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  static Future<List<Post>> guides(http.Client client) async {
    final response = await APIService.fetchGuides(client);

    return compute(parseGuides, response.body);
  }

  //endregion guides

  //region news
  static List<Post> parseNews(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  static Future<List<Post>> news(http.Client client) async {
    final response = await APIService.fetchNews(client);

    return compute(parseNews, response.body);
  }

  //endregion news

  //region happy hour
  static List<RemoteHappyHour> parseHappyHour(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<RemoteHappyHour>((json) => RemoteHappyHour.fromJson(json))
        .toList();
  }

  static Future<List<RemoteHappyHour>> happyHours(http.Client client) async {
    final response = await APIService.fetchHappyHours(client);

    return compute(parseHappyHour, response.body);
  }

  //endregion happy hour

  //region events
  static List<RemoteEvent> parseEvent(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<RemoteEvent>((json) => RemoteEvent.fromJson(json))
        .toList();
  }

  static Future<List<RemoteEvent>> events(http.Client client) async {
    final response = await APIService.fetchHappyHours(client);

    return compute(parseEvent, response.body);
  }
//endregion events

}
