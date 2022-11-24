import 'package:flutter/material.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';

import '../service/home_service.dart';

class HomeViewModel with ChangeNotifier{
  NewReleasesAlbum ?newReleasesAlbum;
  bool isLoadingnNewRelease=true;

  getNewReleaseAlbum() async{
    isLoadingnNewRelease=true;
    newReleasesAlbum = (await HomeServices().getNewReleaseAlbumData())!;
    isLoadingnNewRelease = false;
    notifyListeners();
  }

}