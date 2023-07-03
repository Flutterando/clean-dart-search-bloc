import '../models/result_model.dart';

abstract class SearchDatasource {
  Future<List<ResultModel>> searchText(String textSearch);
}
