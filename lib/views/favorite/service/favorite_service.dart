import 'package:spotify_api/core/base/base_service.dart';
import 'package:spotify_api/views/favorite/model/artist_album.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/favorite/model/artist_with_id.dart';

class FavoriteServices extends BaseService {
  Future<ArtistWithId?> getArtistWithIdData({String? artistId}) async {
    var params = {
      'ids': artistId ?? '0TnOYISbd1XYRBk9myaseg',
    };


    return await fetch<ArtistWithId>("artists",
        model: ArtistWithId(), queryParameters: params);

  }

  Future<ArtistAlbum?> getArtistAlbumData({String? artistId}) async {
    var params = {
      'include_groups': 'single,appears_on',
      'market': 'ES',
      'limit': '10',
      'offset': '0',
    };

    return await fetch<ArtistAlbum>(
        "artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}/albums",
        model: ArtistAlbum(),
        queryParameters: params);
  }

  Future<ArtistTopTracks?> getArtistTopTrackData({String? artistId}) async {
    var params = {
      'market': 'ES',
    };

    return await fetch<ArtistTopTracks>(
        "artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}/top-tracks",
        model: ArtistTopTracks(),
        queryParameters: params);
  }
}
