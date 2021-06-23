class Constants {
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=publishedAt&apiKey=449c36c32769409a8c652bd86a6d3cdc";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&sortBy=publishedAt&apiKey=449c36c32769409a8c652bd86a6d3cdc";
  }
}
