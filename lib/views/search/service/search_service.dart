import 'package:spotify_api/views/search/model/searchmodel.dart';
import '../../../core/base/base_service.dart';
import '../../home/model/categories.dart';

class SearchService extends BaseService {
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

    return await fetch<SearchModel>("search",
        model: SearchModel(), queryParameters: params);
  }

    Future<CategoriesModel?> getCategoriesData() async {
    return await fetch<CategoriesModel>("browse/categories",
        model: CategoriesModel(),
        queryParameters: {
          'country': 'TR',
          'locale': 'TR-tr',
        });
  }

}
