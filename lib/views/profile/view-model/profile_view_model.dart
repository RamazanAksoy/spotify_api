import 'package:flutter/material.dart';

import '../model/playlist_model.dart';
import '../model/profile_model.dart';
import '../service/profile_service.dart';

class ProfileViewModel with ChangeNotifier {
  PlaylistModel? userPlayList;
  ProfileModel? profile;

  bool isLoadingProfile = true;
  bool isLoadingUserPlayList = true;

  bool checkLoading=true;
  checkLoadingfalse(){
    checkLoading=true;
    notifyListeners();
  }
  setCheckLoading(){
    checkLoading=true;
    if(isLoadingProfile==false&&isLoadingUserPlayList==false)
    {
      checkLoading=false;
    }
    notifyListeners();
  }


  getProfile() async {
    isLoadingProfile = true;
    profile = (await ProfileServices().getProfileData());
    isLoadingProfile = false;
    notifyListeners();
    setCheckLoading();
  }

  getUserPlaylist() async {
    isLoadingUserPlayList = true;
    userPlayList = (await ProfileServices().getUserPlaylistData());
    isLoadingUserPlayList = false;
    notifyListeners();
    setCheckLoading();

  }
}
