import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  int selectedTab = 0;
  bool isIconTap = false;
  void selectedTabChange(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void animatedIconStateChange(bool value) {
    isIconTap = value;
    notifyListeners();
  }
}
