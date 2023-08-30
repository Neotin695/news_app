part of 'locale_article_bloc.dart';

sealed class LocaleArticleEvent extends Equatable {
  final ArticleEntity? articleEntity;
  const LocaleArticleEvent({this.articleEntity});

  @override
  List<Object> get props => [articleEntity!];
}

class FetchArticle extends LocaleArticleEvent {
  const FetchArticle();
}

class SaveArticle extends LocaleArticleEvent {
  const SaveArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}

class RemoveArticle extends LocaleArticleEvent {
  const RemoveArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}
