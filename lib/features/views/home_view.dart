import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../product/index.dart';
import '../index.dart';
import '../view_model/home_view_model.dart';

part '../../core/widgets/home_view_widgets.dart';
part 'home_view_part.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewPart with HomeViewWidgets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return _homeViewModel.isLoading
          ? progressIndicator()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const PaddingConstants.homeViewPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RecentylPlayedReal(),
                  addTitle(context, TitlesAndSubtitles.yourShows.getString()),
                  PodcastArea(homeViewModel: _homeViewModel),
                  addTitle(context, TitlesAndSubtitles.mood.getString()),
                  MoodsArea(homeViewModel: _homeViewModel),
                ],
              ),
            );
    }));
  }
}
