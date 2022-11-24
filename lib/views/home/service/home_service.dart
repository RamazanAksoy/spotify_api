import 'package:dio/dio.dart';
import 'package:spotify_api/core/constans/app.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/home/model/album_track.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';
import 'package:spotify_api/views/home/model/several_artist.dart';

import '../model/categories.dart';

class HomeServices {
  Dio dio = Dio(BaseOptions(baseUrl: App.baseUrl));

  Future<SeveralArtist?> getSeveralArtistData() async {
    var params = {
      'ids':
          '2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6',
    };
    try {
      final response = await dio.get("artists",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      final categoriesList = SeveralArtist.fromJson(response.data);
      return categoriesList;
    } catch (e) {}
    return null;
  }

  Future<AlbumTracks?> getPodcastData() async {
    var params = {
      'ids': '77o6BIVlYM3msb4MMIL1jH,0Q86acNRm6V9GYx55SXKwf',
      'market': 'ES',
    };
    try {
      final response = await dio.get("episodes",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      return AlbumTracks.fromJson(response.data);
    } catch (e) {}
    return null;
  }

  Future<AlbumTracks?> getAlbumTrackData({String? albumId}) async {
    var params = {
      'market': 'TR',
      'limit': '10',
      'offset': '0',
    };
    try {
      final response = await dio.get(
          "albums/${albumId ?? '151w1FgRZfnKZA9FEcg9Z3'}/tracks",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      return AlbumTracks.fromJson(response.data);
    } catch (e) {}
    return null;
  }

  Future<ArtistTopTracks?> getArtistIdWithData({String? id}) async {
    var params = {
      'market': 'ES',
    };
    try {
      final response = await dio.get(
          "artists/${id ?? '0TnOYISbd1XYRBk9myaseg'}/top-tracks",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      final categoriesList = ArtistTopTracks.fromJson(response.data);
      return categoriesList;
    } catch (e) {}
    return null;
  }

  Future<NewReleasesAlbum?> getNewReleaseAlbumData() async {
    var params = {
      'country': 'TR',
      'limit': '20',
      'offset': '0',
    };
    try {
      final response = await dio.get("browse/new-releases",
          queryParameters: params,
          options: Options(headers: App.requestHeaders));
      final categoriesList = NewReleasesAlbum.fromJson(response.data);
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
