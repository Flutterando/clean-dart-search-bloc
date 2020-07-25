import 'package:clean_dart_github_search/app/search/infra/models/result_model.dart';

abstract class SearchDatasource {
  Future<List<ResultModel>> searchText(String textSearch);
}
