import 'package:spotify_api/core/base/base_service.dart';
import '../model/playlist_model.dart';
import '../model/profile_model.dart';

class ProfileServices extends BaseService {
  Future<ProfileModel> getProfileData() async {
    return await fetch<ProfileModel>("users/burakseker", model: ProfileModel());
  }

  Future<PlaylistModel> getUserPlaylistData() async {
    var params = {
      'limit': '20',
      'offset': '0',
    };
    return await fetch<PlaylistModel>("users/smedjan/playlists",
        model: PlaylistModel(), queryParameters: params);
  }
}
