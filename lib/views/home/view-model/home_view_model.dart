import 'package:flutter/material.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';
import 'package:spotify_api/views/home/model/several_artist.dart';

import '../service/home_service.dart';

class HomeViewModel with ChangeNotifier {
  NewReleasesAlbum? newReleasesAlbum;
  SeveralArtist? severalArtist;
  ArtistTopTracks? artistTopTracks;
  String? artistId;

  bool isLoadingnNewRelease = true;
  bool isLoadingnSeveralArtist = true;
  bool isLoadingArtistTopTracks = true;

  setArtistId(String id) {
    artistId = id;
    notifyListeners();
    getartistWithId(userId: id);
  }

  getNewReleaseAlbum() async {
    isLoadingnNewRelease = true;
    newReleasesAlbum = (await HomeServices().getNewReleaseAlbumData())!;
    isLoadingnNewRelease = false;
    notifyListeners();
  }

  getSeveralArtist() async {
    isLoadingnSeveralArtist = true;
    severalArtist = (await HomeServices().getSeveralArtistData())!;
    isLoadingnSeveralArtist = false;
    notifyListeners();
  }

  getartistWithId({String? userId}) async {
    isLoadingArtistTopTracks = true;
    artistTopTracks = (await HomeServices().getArtistIdWithData(id: userId))!;
    isLoadingArtistTopTracks = false;
    notifyListeners();
  }
}
