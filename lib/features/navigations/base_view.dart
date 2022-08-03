import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../product/constants/enums.dart';
import '../../product/constants/product_constants.dart';
import '../../product/theme/product_theme.dart';
import '../../utilities/extensions/enum_extension.dart';
import '../../utilities/project_utils.dart';
import 'base_view_model.dart';

part 'base_view_part.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  late final BaseViewModel _baseViewModel;

  @override
  void initState() {
    super.initState();
    _baseViewModel = BaseViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _baseViewModel,
      builder: (context, child) {
        return Scaffold(
          extendBody: ProductConstants.scfExtendBody,
          bottomNavigationBar: const BottomNavigationAndMusicPlayer(),
          body: BottomNavBar.values[context.watch<BaseViewModel>().selectedTab].getPages(_baseViewModel.selectedTab),
        );
      },
    );
  }
}
