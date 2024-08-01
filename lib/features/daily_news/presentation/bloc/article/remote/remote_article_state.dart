import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final ServerException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoadingState extends RemoteArticlesState {
  const RemoteArticlesLoadingState();
}

class RemoteArticlesDoneState extends RemoteArticlesState {
  const RemoteArticlesDoneState(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticlesErrorState extends RemoteArticlesState {
  const RemoteArticlesErrorState(ServerException error) : super(error: error);
}
