// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/resources/data_state.dart';

import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/usecases/fetch_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  RemoteArticleBloc(
    this._articleUseCase,
  ) : super(const RemoteArticleInitial()) {
    on<FetchArticle>(_fetchArticle);
  }
  final FetchArticleUseCase _articleUseCase;
  FutureOr<void> _fetchArticle(event, emit) async {
    final dataState = await _articleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error);
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
