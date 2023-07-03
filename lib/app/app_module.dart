import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'search/data/datasources/github/github_search_datasource.dart';
import 'search/data/datasources/search_datasource.dart';
import 'search/data/repositories/search_repository_impl.dart';
import 'search/domain/blocs/search_bloc.dart';
import 'search/domain/repositories/search_repository.dart';
import 'search/ui/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Dio>(Dio()),
        AutoBind.factory<SearchDatasource>(GithubSearchDatasource.new),
        AutoBind.factory<SearchRepository>(SearchRepositoryImpl.new),
        AutoBind.singleton<SearchBloc>(SearchBloc.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => SearchPage()),
      ];
}
