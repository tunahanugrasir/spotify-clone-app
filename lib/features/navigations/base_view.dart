import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/product_index.dart';
import '../view_model/base_view_model.dart';

part 'base_view_part.dart';

class _BaseViewState extends _BaseViewPart with ProductConstants {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _baseViewModel,
      builder: (context, child) {
        return Scaffold(
          extendBody: extendBody,
          bottomNavigationBar: const BottomNavigationAndMusicPlayer(),
          body: BottomNavBar.values[context.watch<BaseViewModel>().selectedTab].getPages(
            _baseViewModel.selectedTab,
          ),
        );
      },
    );
  }
}
