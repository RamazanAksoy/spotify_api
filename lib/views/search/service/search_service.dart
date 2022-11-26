import 'package:dio/dio.dart';
import 'package:spotify_api/views/search/model/searchmodel.dart';

import '../../../core/constans/app.dart';

class SearchService {
  Dio dio = Dio(BaseOptions(baseUrl: App.baseUrl));

  Future<SearchModel?> getSearchData(
      {String? search,
      String? type,
      String? market,
      String? limit,
      String? offset}) async {
    var params = {
      'q': search ?? 'ceza',
      'type': type ?? 'track,artist',
      'market': market ?? 'TR',
      'limit': limit ?? '5',
      'offset': offset ?? '0',
    };
    try {
      final response = await dio.get("search",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      final categoriesList = SearchModel.fromJson(response.data);
      return categoriesList;
    } catch (e) {}
    return null;
  }
}
