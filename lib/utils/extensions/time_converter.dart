class TimeConverter{

  String milisecontToSecondAndMinute(int ?milisecond){


   int secondd=(milisecond!/1000).toInt();
   int minute=(secondd/60).toInt();
   int second =(secondd%60).toInt();

return "$minute:$second";
  }
}