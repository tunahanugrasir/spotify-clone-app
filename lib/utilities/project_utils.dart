import 'package:flutter/cupertino.dart';

class ProjectBorderRadiusUtils extends BorderRadius {
  ProjectBorderRadiusUtils.circularNormal(super.radius) : super.circular();
  ProjectBorderRadiusUtils.circularMax() : super.circular(50);
  ProjectBorderRadiusUtils.circularLow() : super.circular(7);
}

class ProjectPaddingUtils extends EdgeInsets {
  const ProjectPaddingUtils.symmetricHorizontalLow() : super.symmetric(horizontal: 10);
  const ProjectPaddingUtils.allLow() : super.all(5);
  const ProjectPaddingUtils.onlyLeft() : super.only(left: 5);
}
