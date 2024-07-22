import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';

class NewsApiService {
  final String baseUrl;

  NewsApiService({this.baseUrl = 'https://newsapi.org/v2'});

  Future<List<ArticleModel>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    final queryParameters = <String, dynamic>{
      'apiKey': apiKey,
      'country': country,
      'category': category,
    };
    queryParameters.removeWhere((k, v) => v == null);

    final uri = Uri.parse('$baseUrl/top-headlines')
        .replace(queryParameters: queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = (data['articles'] as List)
          .map<ArticleModel>((i) => ArticleModel.fromJson(i))
          .toList();
      return articles;
    } else {
      throw ServerException(response.reasonPhrase);
    }
  }
}
