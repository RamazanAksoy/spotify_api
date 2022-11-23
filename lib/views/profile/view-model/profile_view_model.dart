import 'package:flutter/material.dart';

import '../model/playlist_model.dart';
import '../model/profile_model.dart';
import '../service/profile_service.dart';

class ProfileViewModel with ChangeNotifier {
  PlaylistModel? userPlayList;
  ProfileModel? profile;
  bool isLoadingProfile = true;
  bool isLoadingUserPlayList = true;

  getProfile() async {
    isLoadingProfile = true;
    profile = (await ProfileServices().getProfileData());
    isLoadingProfile = false;
    print(profile);

    notifyListeners();
  }

  getUserPlaylist() async {
    isLoadingUserPlayList = true;
    userPlayList = (await ProfileServices().getUserPlaylistData());
    isLoadingUserPlayList = false;
    notifyListeners();
  }
}
