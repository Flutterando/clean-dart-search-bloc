import 'package:dio/dio.dart';

import '../../models/result_model.dart';
import '../search_datasource.dart';

class GithubSearchDatasource implements SearchDatasource {
  final Dio dio;

  GithubSearchDatasource(this.dio);

  @override
  Future<List<ResultModel>> searchText(String textSearch) async {
    var result = await this.dio.get("https://api.github.com/search/users?q=${textSearch.trim().replaceAll(' ', '+')}");
    if (result.statusCode == 200) {
      var jsonList = result.data['items'] as List;
      var list = jsonList
          .map((item) => ResultModel(
                nickname: item['login'],
                image: item['avatar_url'],
                url: item['url'],
                name: item['login'],
              ))
          .toList();
      return list;
    } else {
      throw Exception();
    }
  }
}
