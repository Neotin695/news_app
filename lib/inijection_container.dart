import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_source/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/fetch_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/fetch_saved_articles.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/bloc/locale_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  sl.registerSingleton<FetchSavedArticleUseCase>(
      FetchSavedArticleUseCase(sl()));
  sl.registerSingleton<RemoveSavedArticleUseCase>(
      RemoveSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerSingleton<FetchArticleUseCase>(FetchArticleUseCase(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocaleArticleBloc>(
      () => LocaleArticleBloc(sl(), sl(), sl()));
}
