import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../models/recently_items_model.dart';
import '../../product/constants/constants_index.dart';
import '../../product/init/network/network_product.dart';
import '../../product/theme/product_theme.dart';
import '../../product/widget/widget_index.dart';
import '../../service/spotify_service.dart';
import '../../utilities/project_utils.dart';
import '../view_model/home_view_model.dart';

part '../../core/widgets/home_view_widgets.dart';
part 'home_view_part.dart';

class _HomeViewState extends HomeViewPart {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return _homeViewModel.isLoading
          ? const CenterProgressIndicator()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const PaddingUtils.homeViewPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentlyPlayed(
                    homeViewModel: _homeViewModel,
                  ),
                  addTitle(_title),
                  PodcastArea(homeViewModel: _homeViewModel),
                  addTitle(_mood),
                  MoodsArea(homeViewModel: _homeViewModel),
                ],
              ),
            );
    }));
  }
}
