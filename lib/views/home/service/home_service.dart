import 'package:spotify_api/core/base/base_service.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/home/model/album_track.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';
import 'package:spotify_api/views/home/model/podcast.dart';
import 'package:spotify_api/views/home/model/several_artist.dart';

import '../model/categories.dart';

class HomeServices extends BaseService {
  Future<SeveralArtist?> getSeveralArtistData() async {
    var params = {
      'ids':
          '2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6',
    };
    return await fetch<SeveralArtist>("artists",
        model: SeveralArtist(), queryParameters: params);
  }

  Future<PodcastModel?> getPodcastData() async {
    var params = {
      'ids': '77o6BIVlYM3msb4MMIL1jH,0Q86acNRm6V9GYx55SXKwf',
      'market': 'TR',
    };

    return await fetch<PodcastModel>("episodes",
        model: PodcastModel(), queryParameters: params);
  }

  Future<AlbumTracks?> getAlbumTrackData({String? albumId}) async {
    var params = {
      'market': 'TR',
      'limit': '10',
      'offset': '0',
    };

    return await fetch<AlbumTracks>(
        "albums/${albumId ?? '151w1FgRZfnKZA9FEcg9Z3'}/tracks",
        model: AlbumTracks(),
        queryParameters: params);
  }

  Future<ArtistTopTracks?> getArtistIdWithData({String? id}) async {
    var params = {
      'market': 'ES',
    };
    return await fetch<ArtistTopTracks>(
        "artists/${id ?? '0TnOYISbd1XYRBk9myaseg'}/top-tracks",
        model: ArtistTopTracks(),
        queryParameters: params);
  }

  Future<NewReleasesAlbum?> getNewReleaseAlbumData() async {
    var params = {
      'country': 'TR',
      'limit': '20',
      'offset': '0',
    };

    return await fetch<NewReleasesAlbum>("browse/new-releases",
        model: NewReleasesAlbum(), queryParameters: params);
  }

  Future<CategoriesModel?> getCategoriesData() async {
    return await fetch<CategoriesModel>("browse/categories",
        model: CategoriesModel(),
        queryParameters: {
          'country': 'TR',
          'locale': 'TR-tr',
        });
  }

  Future<List<Categories>?> getCategoriesDetailsData(
    String id,
  ) async {
    return await fetch<Categories>("browse/categories/$id/tracks",
        model: Categories());
  }
}
