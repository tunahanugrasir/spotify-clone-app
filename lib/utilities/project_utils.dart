import 'package:flutter/material.dart';

class ProjectBorderRadiusUtils extends BorderRadius {
  ProjectBorderRadiusUtils.circularNormal() : super.circular(30);
  ProjectBorderRadiusUtils.circularMax() : super.circular(50);
  ProjectBorderRadiusUtils.circularLow() : super.circular(7);
}

class PaddingUtils extends EdgeInsets {
  const PaddingUtils.homeViewPadding() : super.only(left: 8, right: 8, bottom: 120);
  const PaddingUtils.libraryViewSpaceBar() : super.symmetric(horizontal: 16, vertical: 16);
  const PaddingUtils.symmetric() : super.symmetric(horizontal: 8, vertical: 60);
  const PaddingUtils.symmetricHorizontalLow() : super.symmetric(horizontal: 10);
  const PaddingUtils.horizontalSymmetric() : super.symmetric(horizontal: 3);
  const PaddingUtils.podcastsAndSongs() : super.only(left: 8, right: 8);
  const PaddingUtils.podcastAndText() : super.only(top: 8.0, bottom: 4);
  const PaddingUtils.justHorizontal() : super.symmetric(horizontal: 8);
  const PaddingUtils.genreImage() : super.only(left: 14, top: 28);
  const PaddingUtils.playPauseIcon() : super.only(right: 20.0);
  const PaddingUtils.songs() : super.only(left: 8, right: 8);
  const PaddingUtils.onlyLeftEight() : super.only(left: 8);
  const PaddingUtils.onlyLeft() : super.only(left: 5);
  const PaddingUtils.onlyRight() : super.only(right: 8);
  const PaddingUtils.onlyTop() : super.only(top: 16);
  const PaddingUtils.allLow() : super.all(5);
  const PaddingUtils.normal() : super.all(8);
  const PaddingUtils.zero() : super.all(0);
}

class IconUtils {
  static const double iconSizeNormal = 28;
}

class ExpandedUtils {
  static const int lowFlex = 1;
  static const int mediumFlex = 2;
  static const int highFlex = 3;
}

class BottomNavigationBarUtils {
  final String musicName = 'Mutlu Ol Yeter\n';
  final String artistName = 'İbrahim Tatlıses';
  static const double rotateValue = 25 / 360;
  static const double zeroElevation = 0;
}

abstract class MusicPlayerVariables {
  final double xAxis = 0;
  final double yAxis = 0.86;
  final double textHeight = 1.5;
  final double letterSpacing = 0.5;
}
