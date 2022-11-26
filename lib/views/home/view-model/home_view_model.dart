
import 'package:flutter/material.dart';
import 'package:spotify_api/views/favorite/model/artist_top_track.dart';
import 'package:spotify_api/views/home/model/album_track.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';
import 'package:spotify_api/views/home/model/podcast.dart';
import 'package:spotify_api/views/home/model/several_artist.dart';

import '../service/home_service.dart';

class HomeViewModel with ChangeNotifier {
  NewReleasesAlbum? newReleasesAlbum;
  SeveralArtist? severalArtist;
  ArtistTopTracks? artistTopTracks;
  AlbumTracks? albumTracks;
  PodcastModel? podcastModel;

  String? artistId;
  int? currentIndexTabContainer;

  bool isLoadingnNewRelease = true;
  bool isLoadingnSeveralArtist = true;
  bool isLoadingArtistTopTracks = true;
  bool isLoadingAlbumTracks = true;
  bool isLoadingPodcast = true;

  bool checkLoading=true;


  checkLoadingfalse(){
    checkLoading=true;
    notifyListeners();
  }
  setCheckLoading(){
    checkLoading=true;
    if(isLoadingnNewRelease==false&&isLoadingnSeveralArtist==false&&isLoadingPodcast==false&&isLoadingArtistTopTracks==false)
      {
        checkLoading=false;
      }
    notifyListeners();
  }

  setcurrentIndexTabContainer(int id) 
  {
    currentIndexTabContainer = id;
    notifyListeners();
  }

  setArtistId(String id) {
    artistId = id;
    notifyListeners();
    getartistWithId(userId: id);
  }

  getAlbumTracks() async {
    isLoadingAlbumTracks = true;
    albumTracks = (await HomeServices().getAlbumTrackData())!;
    isLoadingAlbumTracks = false;
    notifyListeners();
    setCheckLoading();

  }
   getPodcast() async {
    isLoadingPodcast = true;
    podcastModel = (await HomeServices().getPodcastData())!;
    isLoadingPodcast = false;
    notifyListeners();
  }

  getNewReleaseAlbum() async {
    isLoadingnNewRelease = true;
    newReleasesAlbum = (await HomeServices().getNewReleaseAlbumData())!;
    isLoadingnNewRelease = false;
   getartistWithId(userId: newReleasesAlbum!.albums!.items![0].artists![0].id);
    notifyListeners();
    setCheckLoading();

  }

  getSeveralArtist() async {
    isLoadingnSeveralArtist = true;
    severalArtist = (await HomeServices().getSeveralArtistData())!;
    isLoadingnSeveralArtist = false;
    notifyListeners();
    setCheckLoading();

  }

  getartistWithId({String? userId}) async {
    isLoadingArtistTopTracks = true;
    artistTopTracks = (await HomeServices().getArtistIdWithData(id: userId))!;
    isLoadingArtistTopTracks = false;
    notifyListeners();
    setCheckLoading();

  }
}
