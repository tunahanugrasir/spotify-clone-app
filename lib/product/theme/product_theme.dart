import 'package:flutter/material.dart';

import '../constants/product_constants.dart';

class ProductTheme extends ProductColorScheme {
  static const textTheme = TextTheme(
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    subtitle1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ProductColorScheme.secondaryColor),
    subtitle2: TextStyle(fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 12),
    bodyText2: TextStyle(fontSize: 12, color: ProductColorScheme.greyColor),
    labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ProductColorScheme.primaryColor),
  );
}

class ProductColorScheme {
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.white;
  static const Color transparentColor = Colors.transparent;
  static const Color backgroundColor = Color(0xff4815d2);
  static const Color greyColor = Colors.grey;
  static const Color bottomNavigationBarBackgrounColor = Color.fromARGB(0, 255, 255, 255);
  static const Color musicPlayerBackgroundColor = Color(0xff191919);
  static const Color musicPlayerBackgroundColor2 = Color(0xff430906);
  static const Color gradientColor = Color(0xff4e17ec);
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ProductColorScheme.transparentColor,
    textTheme: ProductTheme.textTheme,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: bottomNavigationBarThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ProductColorScheme.primaryColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
      fillColor: ProductColorScheme.secondaryColor,
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
    backgroundColor: ProductColorScheme.bottomNavigationBarBackgrounColor,
    selectedItemColor: ProductColorScheme.secondaryColor,
    unselectedItemColor: ProductColorScheme.greyColor,
    selectedLabelStyle: ProductTheme.textTheme.bodyText1,
    unselectedLabelStyle: ProductTheme.textTheme.bodyText1,
  );
}
