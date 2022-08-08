import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/navigations/base_view.dart';
import 'product/constants/product_constants.dart';
import 'product/theme/product_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorsScheme.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProductConstants.title,
      theme: ThemeData(fontFamily: ProductConstants.font),
      debugShowCheckedModeBanner: ProductConstants.debugMode,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme(),
      home: const BaseView(),
    );
  }
}
