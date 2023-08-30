import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:news_app/features/daily_news/data/data_source/local/dao/aritcle_dao.dart';
import 'package:news_app/features/daily_news/data/model/article_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDAO get articleDAO;
}
