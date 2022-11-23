import 'package:flutter/material.dart';
import 'package:spotify_api/views/favorite/model/artist_album.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/favorite/model/artist_with_id.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';

import '../service/favorite_service.dart';

class FavoritiesViewModel with ChangeNotifier {
  ArtistWithId? artistWithId;
  ArtistAlbum? artistAlbum;
  ArtistTopTracks? artistTopTracks;

  bool isLoadingArtistWithId = true;
  bool isLoadingArtistAlbum = true;
  bool isLoadingArtistTopTrack = true;

  getArtistWithId() async {
    isLoadingArtistWithId = true;
    artistWithId = (await FavoriteServices().getArtistWithIdData())!;
    isLoadingArtistWithId = false;
    notifyListeners();
  }

  getArtistAlbum() async {
    isLoadingArtistAlbum = true;
    artistAlbum = (await FavoriteServices().getArtistAlbumData())!;
    isLoadingArtistAlbum = false;
    print(artistAlbum);

    notifyListeners();
  }

  getArtistTopTrack() async {
    isLoadingArtistTopTrack = true;
    artistTopTracks = (await FavoriteServices().getArtistTopTrackData())!;
    isLoadingArtistTopTrack = false;
    notifyListeners();
  }
}
