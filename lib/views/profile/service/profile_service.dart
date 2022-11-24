import 'package:dio/dio.dart';
import 'package:spotify_api/core/constans/app.dart';
import '../model/playlist_model.dart';
import '../model/profile_model.dart';

class ProfileServices {
  Dio dio = Dio(BaseOptions(baseUrl: App.baseUrl));

  Future<ProfileModel> getProfileData() async {
    var res = await dio.get('users/burakseker',
        options: Options(headers: App.requestHeaders));
    if (res.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    }
    return ProfileModel.fromJson(res.data);
  }

  Future<PlaylistModel> getUserPlaylistData() async {
    var params = {
      'limit': '20',
      'offset': '0',
    };

    var res = await dio.get('users/smedjan/playlists',
        queryParameters: params, options: Options(headers: App.requestHeaders));
    if (res.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    }
    return PlaylistModel.fromJson(res.data);
  }
}
