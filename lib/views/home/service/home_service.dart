
import 'package:dio/dio.dart';
import 'package:spotify_api/views/home/model/new_releases_album.dart';

import '../model/categories.dart';

class HomeServices{












Dio dio=Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/")); 
  Map<String, String> requestHeaders = {
      'authorization': ' Bearer BQBEUz9JFYTWeRHJ6Ipc0DcJ32uOWU6G5XEyZLIyzQBR4aoY3XYyyBNIgG4VzPR37gWVgCMTFPSX7DVQSIqXkcQNPnQCZ79mWkrfbogXfDLVQDPTTmgQzWJe0YpGrOhfjIi9dSBXLyPodHt6ibqAFqRlxgw_pMnVGtkx0P9bwnzo0fembE5eoCKtJ7Xry194EeJIa8ogvM-1nQvGIqhBvEZPKENJWqB4dgpLmJYI9x2pPsIhotpttHrF5S5sWZh88AKuU1i6s5c',
      'Content-type': 'application/json',      
     };



 Future<NewReleasesAlbum?>  getNewReleaseAlbumData () async {

    var params = {
    'country': 'TR',
    'limit': '1',
    'offset': '0',
  };
  try {
       final response = await dio.get("browse/new-releases",queryParameters: 
    params
    , options: Options(headers: requestHeaders) );
   final categoriesList= NewReleasesAlbum.fromJson(response.data);
  print(categoriesList.toString());
    return categoriesList;
  } catch (e) {
    
  }
  return null;
}



 Future<CategoriesModel?>  getCategoriesData () async {
  try {
       final response = await dio.get("browse/categories",queryParameters: {
      'country':'TR',
      'locale':'TR-tr',
    }, options: Options(headers: requestHeaders) );
   final categoriesList= CategoriesModel.fromJson(response.data);
print(categoriesList.toString());
    return categoriesList;
  } catch (e) {
    
  }
  return null;
}



 Future<List<Categories>?>  getCategoriesDetailsData (String id,) async {
  try {
       final response = await dio.get("browse/categories/$id/tracks",queryParameters: {
      'country':'TR',
      'locale':'TR-tr',
    }, options: Options(headers: requestHeaders) );


   List<dynamic> aa=   response.data["categories"]["items"];
   
  List<Categories> categoriesList = aa.map((user) =>   Categories.fromJson(user)).toList();
  print(categoriesList);
    return categoriesList;
  } catch (e) {
    
  }
  return null;
}






}