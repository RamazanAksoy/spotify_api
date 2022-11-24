import 'package:spotify_api/views/favorite/model/artist_album.dart';

class TimeConverter {
  String milisecontToSecondAndMinute(int? milisecond) {
    int secondd = (milisecond! / 1000).toInt();
    int minute = (secondd / 60).toInt();
    int second = (secondd % 60).toInt();

    return "$minute:$second";
  }

  String artistListToString(dynamic list) {
    String nameList = "";
    for (int i = 0; i < list!.length; i++) {
      nameList +=
          list[i].name.toString() + ((i != list!.length - 1) ? " , " : '');
    }
    return nameList;
  }
}
