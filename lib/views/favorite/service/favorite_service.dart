import 'package:dio/dio.dart';
import 'package:spotify_api/core/constans/app.dart';
import 'package:spotify_api/views/favorite/model/artist_album.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/favorite/model/artist_with_id.dart';

class FavoriteServices {
  Dio dio = Dio(BaseOptions(baseUrl: App.baseUrl));

  Future<ArtistWithId?> getArtistWithIdData({String? artistId}) async {
    var params = {
      'ids': artistId ??
          '2CIMQHirSU0MQqyYHq0eOx%2C57dN52uHvrHOxijzpIgu3E%2C1vCWHaC5f2uS3yhpwWbIA6',
    };
    print(params);
    final response = await dio.get("artists",
        queryParameters: params, options: Options(headers: App.requestHeaders));
    if (response.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    }

    return ArtistWithId.fromJson(response.data);
  }

  Future<ArtistAlbum?> getArtistAlbumData({String? artistId}) async {
    var params = {
      'include_groups': 'single,appears_on',
      'market': 'ES',
      'limit': '10',
      'offset': '0',
    };
    final response = await dio.get(
        "artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}/albums",
        queryParameters: params,
        options: Options(headers: App.requestHeaders));
    if (response.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    }
    return ArtistAlbum.fromJson(response.data);
  }

  Future<ArtistTopTracks?> getArtistTopTrackData({String? artistId}) async {
    var params = {
      'market': 'ES',
    };
    final response = await dio.get(
        "artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}/top-tracks",
        queryParameters: params,
        options: Options(headers: App.requestHeaders));
    if (response.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    }
    return ArtistTopTracks.fromJson(response.data);
  }
}
