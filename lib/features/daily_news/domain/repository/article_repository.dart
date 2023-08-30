import 'package:news_app/features/daily_news/domain/entities/article.dart';

import '../../../../core/core.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> fetchNewsArticles();

  Future<List<ArticleEntity>> fetchSavedArticles();

  Future<void> saveArticle(ArticleEntity articleEntity);

  Future<void> removeSavedArticle(ArticleEntity articleEntity);
}
