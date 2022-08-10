import 'package:flutter/material.dart';

import '../../product/init/network/network_product.dart';
import '../../product/theme/product_theme.dart';
import '../../service/spotify_service.dart';
import '../view_model/home_view_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel(SpotifyService(NetworkProduct.instance.networkManager));
    _homeViewModel.fetchAllDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyCustomNestedScrollWidget(homeViewModel: _homeViewModel));
  }
}

class MyCustomNestedScrollWidget extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const MyCustomNestedScrollWidget({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            _sliverAppBar(),
            _sliverSearchBar(),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber.shade900,
                    height: 100,
                    width: 100,
                    child: Center(
                        child: Text(
                      "$index",
                      style: const TextStyle(fontSize: 50, color: Colors.black),
                    )),
                  ),
                );
              },
            ))
          ];
        },
        body: ListView.builder(itemBuilder: ((context, index) {
          return Container();
        }))
        // body: ListView(
        //     physics: const BouncingScrollPhysics(),
        //     padding: const EdgeInsets.symmetric(horizontal: 8),
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 24.0),
        //         child: Text(
        //           'Your top genres',
        //           style: ProductTheme.textTheme.subtitle1,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 225,
        //         width: MediaQuery.of(context).size.width,
        //         child: GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             childAspectRatio: context.width / (0.3 * context.height),
        //             crossAxisSpacing: 7,
        //             mainAxisSpacing: 7,
        //           ),
        //           physics: const NeverScrollableScrollPhysics(),
        //           itemCount: 4,
        //           padding: const EdgeInsets.all(0),
        //           itemBuilder: (context, index) {
        //             return const GenreCards(
        //               backgroundColor: Color(0xff1DB954),
        //               genreImageURL:
        //                   "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
        //               genreName: 'Hip-Hop',
        //             );
        //           },
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(top: 24.0),
        //         child: Text(
        //           'Browse all',
        //           style: ProductTheme.textTheme.subtitle1,
        //         ),
        //       ),
        //       GridView.builder(
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //           scrollDirection: Axis.vertical,
        //           physics: const BouncingScrollPhysics(),
        //           itemBuilder: (context, index) {
        //             SearchModel searchItem = homeViewModel.searchItems[index];
        //             return GenreCards(
        //                 genreName: searchItem.title ?? '',
        //                 genreImageURL: searchItem.imageURL ?? '',
        //                 backgroundColor: Color(searchItem.backgroundColor ?? 000000));
        //           }),
        //     ]),
        );
  }

  SliverAppBar _sliverSearchBar() {
    return const SliverAppBar(
      pinned: true,
      expandedHeight: 0,
      toolbarHeight: 0,
      backgroundColor: ColorsScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8, top: 16),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabled: false,
              prefixIcon: Icon(
                Icons.search_outlined,
                size: 31,
              ),
              hintText: 'Artists, songs, or podcasts',
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      backgroundColor: ColorsScheme.primary,
      expandedHeight: 0,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: ProductTheme.textTheme.headline5,
              ),
              const Icon(
                Icons.camera_alt_outlined,
                size: 31,
              )
            ],
          ),
        ),
      ),
    );
  }
}
