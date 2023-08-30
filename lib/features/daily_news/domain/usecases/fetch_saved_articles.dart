import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class FetchSavedArticleUseCase implements UseCases<List<ArticleEntity>, void> {
  final ArticleRepository _repository;

  FetchSavedArticleUseCase(this._repository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _repository.fetchSavedArticles();
  }
}
