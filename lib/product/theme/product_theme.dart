import 'package:flutter/material.dart';

import '../constants/product_constants.dart';

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
}

class ProductTheme {
  static const textTheme = TextTheme(
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headline6: TextStyle(color: ColorsScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20),
    subtitle1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsScheme.secondary),
    subtitle2: TextStyle(fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 12),
    bodyText2: TextStyle(fontSize: 12, color: ColorsScheme.grey),
    labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorsScheme.primary),
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
    elevation: ProductConstants.zeroElevation,
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorsScheme.bottomNavigationBarBackgrounColor,
    selectedItemColor: ColorsScheme.secondary,
    unselectedItemColor: ColorsScheme.grey,
    selectedLabelStyle: ProductTheme.textTheme.bodyText1,
    unselectedLabelStyle: ProductTheme.textTheme.bodyText1,
  );
}
