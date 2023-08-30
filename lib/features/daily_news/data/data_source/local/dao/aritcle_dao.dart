import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/model/article_model.dart';

@dao
abstract class ArticleDAO {
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query('SELECT * FROM  articles')
  Future<List<ArticleModel>> fetchArticles();
}
