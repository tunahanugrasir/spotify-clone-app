import 'package:flutter/material.dart';
import 'package:spotify_clone_app/product/constants/enums.dart';

class BottomNavigationModel {
  final String label;
  final IconData icon;

  BottomNavigationModel(this.label, this.icon);
}

class BottomNavigationListModel {
  late final List<BottomNavigationModel> _bottomNavigationList;
  BottomNavigationListModel() {
    _bottomNavigationList = [
      BottomNavigationModel(BottomNavBar.home.getText(), BottomNavBar.home.getIcon()),
      BottomNavigationModel(BottomNavBar.search.getText(), BottomNavBar.search.getIcon()),
      BottomNavigationModel(BottomNavBar.yourLibrary.getText(), BottomNavBar.yourLibrary.getIcon()),
    ];
  }

  List<BottomNavigationBarItem> toWidgets() {
    return _bottomNavigationList
        .map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ))
        .toList();
  }
}
