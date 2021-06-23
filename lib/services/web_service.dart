import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mcc_final_project/model/news_article.dart';
import 'package:mcc_final_project/utility/constants.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final response = await http.get(Constants.headlinesFor(keyword));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2021-05-02&sortBy=publishedAt&apiKey=449c36c32769409a8c652bd86a6d3cdc";

    final response = await http.get(url);
    final result = jsonDecode(response.body);
    Iterable list = result["articles"];
    return list.map((e) => NewsArticle.fromJSON(e)).toList();

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to get top news ');
    }
  }
}
