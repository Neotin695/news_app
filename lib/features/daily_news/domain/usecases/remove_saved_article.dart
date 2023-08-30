import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class RemoveSavedArticleUseCase implements UseCases<void, ArticleEntity> {
  final ArticleRepository _repository;

  RemoveSavedArticleUseCase(this._repository);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _repository.removeSavedArticle(params!);
  }
}
