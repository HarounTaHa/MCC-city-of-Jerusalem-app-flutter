import 'package:flutter/material.dart';
import 'package:mcc_final_project/model/view_models_api/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          onTap: () {
            this.onSelected(article);
          },
          leading: Container(
              width: 100,
              height: 100,
              child: article.imageURL == null
                  ? Image.asset("assets/jerusalem_2.png")
                  : Image.network(article.imageURL)),
          title: Text(article.title),
        );
      },
    );
  }
}
