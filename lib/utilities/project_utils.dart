import 'package:flutter/cupertino.dart';

class ProjectBorderRadiusUtils extends BorderRadius {
  ProjectBorderRadiusUtils.circularNormal(super.radius) : super.circular();
  ProjectBorderRadiusUtils.circularMax() : super.circular(50);
  ProjectBorderRadiusUtils.circularLow() : super.circular(7);
}

class PaddingConstants extends EdgeInsets {
  const PaddingConstants.symmetric() : super.symmetric(horizontal: 8, vertical: 60);
  const PaddingConstants.homeViewPadding() : super.only(left: 8, right: 8, bottom: 120);
  const PaddingConstants.justHorizontal() : super.symmetric(horizontal: 8);
  const PaddingConstants.symmetricHorizontalLow() : super.symmetric(horizontal: 10);
  const PaddingConstants.allLow() : super.all(5);
  const PaddingConstants.normal() : super.all(8);
  const PaddingConstants.onlyLeft() : super.only(left: 5);
  const PaddingConstants.genreImage() : super.only(left: 14, top: 28);
}
