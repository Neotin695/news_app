import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class FetchArticleUseCase
    implements UseCases<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _repository;

  FetchArticleUseCase(this._repository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _repository.fetchNewsArticles();
  }
}
