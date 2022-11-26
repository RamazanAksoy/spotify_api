import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api/views/favorite/view-model/favorities_view_model.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';
import 'package:spotify_api/views/profile/view-model/profile_view_model.dart';

class BottomViewModel extends ChangeNotifier {
  int customSelectedIndex = 0;

  changedCustomSelectedIndex(int index,context) {
    customSelectedIndex = index;
    notifyListeners();
    Provider.of<HomeViewModel>(context,listen: false).checkLoadingfalse();
    Provider.of<FavoritiesViewModel>(context,listen: false).checkLoadingfalse();
    Provider.of<ProfileViewModel>(context,listen: false).checkLoadingfalse();
  }
}
