import 'package:flutter/material.dart';
import 'package:spotify_clone_app/product/constants/enums.dart';

class BottomNavigationModel {
  final String label;
  final IconData activeIcon;
  final IconData inActiveIcon;

  BottomNavigationModel(this.label, this.activeIcon, this.inActiveIcon);
}

class BottomNavigationListModel {
  late final List<BottomNavigationModel> _bottomNavigationList;
  BottomNavigationListModel() {
    _bottomNavigationList = [
      BottomNavigationModel(
          BottomNavBar.home.getText(), BottomNavBar.home.getActiveIcon(), BottomNavBar.home.getInactiveIcon()),
      BottomNavigationModel(
          BottomNavBar.search.getText(), BottomNavBar.search.getActiveIcon(), BottomNavBar.search.getInactiveIcon()),
      BottomNavigationModel(BottomNavBar.yourLibrary.getText(), BottomNavBar.yourLibrary.getActiveIcon(),
          BottomNavBar.yourLibrary.getInactiveIcon()),
    ];
  }

  List<BottomNavigationBarItem> toWidgets() {
    return _bottomNavigationList
        .map((item) => BottomNavigationBarItem(
            icon: Icon(item.inActiveIcon), label: item.label, activeIcon: Icon(item.activeIcon)))
        .toList();
  }
}
