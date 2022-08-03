import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../product/constants/enums.dart';
import '../../product/constants/padding_constants.dart';
import '../../product/init/network/network_product.dart';
import '../../product/widget/moods_area_widget.dart';
import '../../product/widget/podcast_area_widget.dart';
import '../../service/spotify_service.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _homeViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeViewModel = HomeViewModel(SpotifyService(NetworkProduct.instance.networkManager));
    _homeViewModel.fetchAllDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return _homeViewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(padding: const PaddingConstants.symmetric(), children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  baseTitleAndButtons(context, true, TitlesAndSubtitles.goodEvening.getString()),
                  const RecentlyPlayed(),
                  baseTitleAndButtons(context, false, TitlesAndSubtitles.yourShows.getString()),
                  PodcastArea(homeViewModel: _homeViewModel),
                  baseTitleAndButtons(context, false, TitlesAndSubtitles.mood.getString()),
                  MoodsArea(homeViewModel: _homeViewModel),
                  baseTitleAndButtons(context, false, TitlesAndSubtitles.mood.getString()),
                  MoodsArea(homeViewModel: _homeViewModel),
                  baseTitleAndButtons(context, false, TitlesAndSubtitles.mood.getString()),
                  MoodsArea(homeViewModel: _homeViewModel),
                  baseTitleAndButtons(context, false, TitlesAndSubtitles.mood.getString()),
                  MoodsArea(homeViewModel: _homeViewModel),
                ],
              )
            ]);
    }));
  }

  Widget baseTitleAndButtons(BuildContext context, bool isHasButton, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addBaseTitle(title, context),
        isHasButton ? addButtons() : const SizedBox(),
      ],
    );
  }

  Widget addBaseTitle(String title, BuildContext context) {
    const int medFlex = 2;
    return Expanded(
      flex: medFlex,
      child: Text(title, style: Theme.of(context).textTheme.headline5),
    );
  }

  Widget addButtons() {
    const int minFlex = 1;
    const double iconSize = 28;
    return Expanded(
      flex: minFlex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.notifications_none_outlined, size: iconSize),
          Icon(Icons.history_outlined, size: iconSize),
          Icon(Icons.settings_outlined, size: iconSize),
        ],
      ),
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xff2e2c2c),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://community.spotify.com/t5/image/serverpage/image-id/104727iC92B541DB372FBC7/image-size/large?v=v2&px=999",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Liked Songs", style: Theme.of(context).textTheme.subtitle2)
                ],
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
        ),
      ),
    );
  }
}
