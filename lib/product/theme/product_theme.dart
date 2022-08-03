import 'package:flutter/material.dart';

import '../constants/product_constants.dart';

class ProductTheme extends ProductColorScheme {
  static const textTheme = TextTheme(
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 12),
    bodyText2: TextStyle(fontSize: 12, color: ProductColorScheme.greyColor),
  );
}

class ProductColorScheme {
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.white;
  static const Color backgroundColor = Color(0xff4815d2);
  static const Color greyColor = Colors.grey;
  static const Color bottomNavigationBarBackgrounColor = Color.fromARGB(0, 255, 255, 255);
  static const Color musicPlayerBackgroundColor = Color(0xff191919);
  static const Color musicPlayerBackgroundColor2 = Color(0xff430906);
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: ProductTheme.textTheme,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: bottomNavigationBarThemeData());
}

BottomNavigationBarThemeData bottomNavigationBarThemeData() {
  return BottomNavigationBarThemeData(
    elevation: ProductConstants.appBarelevation,
    type: BottomNavigationBarType.fixed,
    backgroundColor: ProductColorScheme.bottomNavigationBarBackgrounColor,
    selectedItemColor: ProductColorScheme.secondaryColor,
    unselectedItemColor: ProductColorScheme.greyColor,
    selectedLabelStyle: ProductTheme.textTheme.bodyText1,
    unselectedLabelStyle: ProductTheme.textTheme.bodyText1,
  );
}
