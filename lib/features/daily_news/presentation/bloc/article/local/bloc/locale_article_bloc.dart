import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/domain.dart';
import 'package:news_app/features/daily_news/domain/usecases/fetch_saved_articles.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';

part 'locale_article_event.dart';
part 'locale_article_state.dart';

class LocaleArticleBloc extends Bloc<LocaleArticleEvent, LocaleArticleState> {
  LocaleArticleBloc(this._saveArticleUseCase, this._removeSavedArticleUseCase,
      this._fetchSavedArticleUseCase)
      : super(LocaleArticleInitial()) {
    on<FetchArticle>(_fetchArticle);
    on<SaveArticle>(_saveArticle);
    on<RemoveArticle>(_removeArticle);
  }

  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveSavedArticleUseCase _removeSavedArticleUseCase;
  final FetchSavedArticleUseCase _fetchSavedArticleUseCase;

  FutureOr<void> _removeArticle(RemoveArticle event, emit) async {
    await _removeSavedArticleUseCase(params: event.articleEntity);
    add(const FetchArticle());
  }

  FutureOr<void> _saveArticle(SaveArticle event, emit) async {
    await _saveArticleUseCase(params: event.articleEntity);
    add(const FetchArticle());
  }

  FutureOr<void> _fetchArticle(event, emit) async {
    emit(LocalArticleLoading());
    final article = await _fetchSavedArticleUseCase();
    emit(LocaleArticleDone(article));
  }
}
