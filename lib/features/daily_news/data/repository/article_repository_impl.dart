import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final articles = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      return DataSuccess(articles);
    } on ServerException catch (e) {
      return DataFailed(e);
    } catch (_) {
      return const DataFailed(
        ServerException('An unexpected error has occurred!'),
      );
    }
  }
}
