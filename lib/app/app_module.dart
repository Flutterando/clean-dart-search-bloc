import 'package:clean_dart_github_search/app/search/presenter/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:clean_dart_github_search/app/app_widget.dart';

import 'search/domain/usecases/search_by_text.dart';
import 'search/external/github/github_search_datasource.dart';
import 'search/infra/repositories/search_repository_impl.dart';
import 'search/presenter/search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SearchByTextImpl,
        $SearchRepositoryImpl,
        $GithubSearchDatasource,
        Bind((i) => Dio()),
        $SearchBloc,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
