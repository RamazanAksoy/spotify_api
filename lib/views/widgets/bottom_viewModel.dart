import 'package:flutter/material.dart';

class BottomViewModel extends ChangeNotifier {
  int customSelectedIndex = 0;

  changedCustomSelectedIndex(int index) {
    customSelectedIndex = index;
    notifyListeners();
  }
}
