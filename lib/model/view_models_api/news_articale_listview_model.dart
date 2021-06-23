import 'package:flutter/cupertino.dart';
import 'package:mcc_final_project/model/news_article.dart';
import 'package:mcc_final_project/model/view_models_api/news_article_view_model.dart';
import 'package:mcc_final_project/services/web_service.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();
  //--------------------------------------------------------

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  //----------------------------------------
  void populateTopHeadLines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticleList = await WebService().fetchTopHeadLines();
    this.articles =
        newsArticleList.map((e) => NewsArticleViewModel(article: e)).toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
