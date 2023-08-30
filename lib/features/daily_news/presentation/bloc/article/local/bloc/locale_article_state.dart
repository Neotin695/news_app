part of 'locale_article_bloc.dart';

sealed class LocaleArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  const LocaleArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

final class LocaleArticleInitial extends LocaleArticleState {}

final class LocalArticleLoading extends LocaleArticleState {}

final class LocaleArticleDone extends LocaleArticleState {
  const LocaleArticleDone(List<ArticleEntity> artcles)
      : super(articles: artcles);
}
