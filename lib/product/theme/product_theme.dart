import 'package:flutter/material.dart';

import '../../utilities/project_utils.dart';

class ColorsScheme {
  static const Color primary = Colors.black;
  static const Color secondary = Colors.white;
  static const Color spotifyGreen = Color(0xff1DB954);
  static const Color transparent = Colors.transparent;
  static const Color grey = Colors.grey;
  static const Color gradient = Color(0xff4e17ec);
  static const Color bottomNavigationBarBackgrounColor = Color.fromARGB(0, 255, 255, 255);
  static const Color musicPlayerBackgroundColor = Color(0xff191919);
  static const Color musicPlayerBackgroundColor2 = Color(0xff430906);
  static const Color title = Colors.white38;
  static const Color subtitle = Colors.white70;
}

class ProductTheme {
  static const textTheme = TextTheme(
    headline1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorsScheme.subtitle),
    headline2: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsScheme.secondary),
    headline3: TextStyle(fontSize: 13, color: ColorsScheme.grey),
    headline4: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsScheme.secondary),
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorsScheme.secondary),
    subtitle1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsScheme.secondary),
    subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 12),
    bodyText2: TextStyle(fontSize: 12, color: ColorsScheme.grey),
    labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsScheme.primary),
  );

  static const baseBottomBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color.fromARGB(233, 0, 0, 0), Colors.black54],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.7, 1]),
  );

  final musicPlayerBoxDecoration = BoxDecoration(
    color: ColorsScheme.musicPlayerBackgroundColor2,
    borderRadius: ProjectBorderRadiusUtils.circularLow(),
  );

  final musicProgressionBoxDecoration = BoxDecoration(
    color: ColorsScheme.secondary,
    borderRadius: ProjectBorderRadiusUtils.circularMax(),
  );

  final headerBoxDecoration = BoxDecoration(
    borderRadius: ProjectBorderRadiusUtils.circularMax(),
    color: ColorsScheme.gradient,
    border: Border.all(
      color: ColorsScheme.primary,
      width: 0.5,
    ),
  );

  final recentlyItemBoxDecoration = BoxDecoration(
    color: const Color(0xff2e2c2c),
    borderRadius: BorderRadius.circular(5),
  );

  final homeViewStackBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0, 0.4],
      tileMode: TileMode.repeated,
      colors: [
        ColorsScheme.gradient,
        Colors.black.withOpacity(0.6),
      ],
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorsScheme.transparent,
    textTheme: ProductTheme.textTheme,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: bottomNavigationBarThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsScheme.primary,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
      fillColor: ColorsScheme.secondary,
      filled: true,
      hintStyle: ProductTheme.textTheme.labelMedium,
      isDense: true,
    ),
  );
}

BottomNavigationBarThemeData bottomNavigationBarThemeData() {
  return BottomNavigationBarThemeData(
    elevation: BottomNavigationBarUtils.zeroElevation,
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorsScheme.bottomNavigationBarBackgrounColor,
    selectedItemColor: ColorsScheme.secondary,
    unselectedItemColor: ColorsScheme.grey,
    selectedLabelStyle: ProductTheme.textTheme.bodyText1,
    unselectedLabelStyle: ProductTheme.textTheme.bodyText1,
  );
}
