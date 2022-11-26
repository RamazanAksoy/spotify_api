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

  bool checkLoading=true;

  checkLoadingfalse(){
    checkLoading=true;
    notifyListeners();
  }
  setCheckLoading(){
    checkLoading=true;
    if(isLoadingArtistWithId==false&&isLoadingArtistAlbum==false&&isLoadingArtistTopTrack==false)
    {
      checkLoading=false;
    }
    notifyListeners();
  }

  getArtistWithId({String ?artistId}) async {
    isLoadingArtistWithId = true;
    artistWithId = (await FavoriteServices().getArtistWithIdData(artistId: artistId))!;
    isLoadingArtistWithId = false;
    notifyListeners();
    setCheckLoading();
  }

  Future<dynamic> getArtistAlbum({String ?artistId}) async {
    isLoadingArtistAlbum = true;
    artistAlbum = (await FavoriteServices().getArtistAlbumData(artistId: artistId))!;
    isLoadingArtistAlbum = false;
    notifyListeners();
    setCheckLoading();

  }

  getArtistTopTrack({String ?artistId}) async {
    isLoadingArtistTopTrack = true;
    artistTopTracks = (await FavoriteServices().getArtistTopTrackData(artistId: artistId))!;
    isLoadingArtistTopTrack = false;
    notifyListeners();
    setCheckLoading();

  }
}
