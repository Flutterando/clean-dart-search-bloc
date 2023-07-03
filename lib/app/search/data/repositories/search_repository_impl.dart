import 'package:clean_dart_github_search/app/search/domain/errors/erros.dart';
import 'package:clean_dart_github_search/app/search/domain/repositories/search_repository.dart';
import 'package:clean_dart_github_search/app/search/domain/states/search_state.dart';

import '../datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<SearchState> getUsers(String searchText) async {
    try {
      var list = await datasource.searchText(searchText);
      return SuccessState(list);
    } catch (e) {
      return ErrorState(ErrorSearch());
    }
  }
}
