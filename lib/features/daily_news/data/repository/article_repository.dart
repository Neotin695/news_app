import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/core.dart';
import 'package:news_app/features/daily_news/data/data_source/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/model/article_model.dart';

import '../../domain/domain.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _apiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._apiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> fetchNewsArticles() async {
    try {
      final httpResponse = await _apiService.fetchNewsArticle(
        apiKey: newsapiKey,
        country: newsCountry,
        category: newsCategory,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        print(httpResponse.response);
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print('catch: $e');
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> fetchSavedArticles() async {
    return await _appDatabase.articleDAO.fetchArticles();
  }

  @override
  Future<void> removeSavedArticle(ArticleEntity articleEntity) async {
    return await _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(articleEntity));
  }

  @override
  Future<void> saveArticle(ArticleEntity articleEntity) async {
    return await _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(articleEntity));
  }
}
