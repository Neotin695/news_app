import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/inijection_container.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: BlocProvider<RemoteArticleBloc>(
        create: (context) => sl()..add(FetchArticle()),
        child: const DailyNews(),
      ),
    );
  }
}
