import 'package:flutter/material.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';

import '../model/categories.dart';
import '../service/home_service.dart';

class CategorieViewModel with ChangeNotifier{
  CategoriesModel ?categoriesModel;
  NewReleasesAlbum ?newReleasesAlbum;
  bool isLoading=true;

  getCategories() async{
    isLoading=true;
    categoriesModel = (await HomeServices().getCategoriesData())!;
    isLoading = false;
    notifyListeners();
  }


    getNewReleaseAlbum() async{
    isLoading=true;
    newReleasesAlbum = (await HomeServices().getNewReleaseAlbumData())!;
    isLoading = false;
    notifyListeners();
  }


  
}