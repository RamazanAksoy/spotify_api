import 'package:dio/dio.dart';
import 'package:spotify_api/core/constans/app.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';

import '../model/categories.dart';

class HomeServices {
  Dio dio = Dio(BaseOptions(baseUrl: App.baseUrl));

  Future<NewReleasesAlbum?> getNewReleaseAlbumData() async {
    var params = {
      'country': 'TR',
      'limit': '1',
      'offset': '0',
    };
    try {
      final response = await dio.get("browse/new-releases",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      final categoriesList = NewReleasesAlbum.fromJson(response.data);
      print(categoriesList.toString());
      return categoriesList;
    } catch (e) {}
    return null;
  }

  Future<CategoriesModel?> getCategoriesData() async {
    try {
      final response = await dio.get("browse/categories",
          queryParameters: {
            'country': 'TR',
            'locale': 'TR-tr',
          },
          options: Options(headers: App.requestHeaders));
      final categoriesList = CategoriesModel.fromJson(response.data);
      print(categoriesList.toString());
      return categoriesList;
    } catch (e) {}
    return null;
  }

  Future<List<Categories>?> getCategoriesDetailsData(
    String id,
  ) async {
    try {
      final response = await dio.get("browse/categories/$id/tracks",
          queryParameters: {
            'country': 'TR',
            'locale': 'TR-tr',
          },
          options: Options(headers: App.requestHeaders));

      List<dynamic> aa = response.data["categories"]["items"];

      List<Categories> categoriesList =
          aa.map((user) => Categories.fromJson(user)).toList();
      print(categoriesList);
      return categoriesList;
    } catch (e) {}
    return null;
  }
}
