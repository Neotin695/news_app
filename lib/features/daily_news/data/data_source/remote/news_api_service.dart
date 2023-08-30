import 'package:news_app/features/daily_news/data/model/article_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/core.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> fetchNewsArticle({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
