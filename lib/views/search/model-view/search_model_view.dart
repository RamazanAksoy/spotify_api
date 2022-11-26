import 'package:flutter/material.dart';
import 'package:spotify_api/views/search/model/searchmodel.dart';
import 'package:spotify_api/views/search/service/search_service.dart';

class SearchViewModel extends ChangeNotifier{

SearchModel ?searchModel;
bool isLoadingSearch=true;

  getSearch({String ?search,String ?type,String? market,String ?limit,String ?offset}) async
  {
    isLoadingSearch = true;
    searchModel = (await SearchService().getSearchData(limit: limit,market: market,offset: offset,search: search,type: type));
    isLoadingSearch = false;
    notifyListeners();
  }




}