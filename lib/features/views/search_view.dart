import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../product/theme/product_theme.dart';
import '../../product/widget/genre_cards.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCustomNestedScrollWidget(),
    );
  }
}

class MyCustomNestedScrollWidget extends StatelessWidget {
  const MyCustomNestedScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          _sliverAppBar(),
          _sliverSearchBar(),
        ];
      },
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Your top genres',
                style: ProductTheme.textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 225,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: context.width / (0.3 * context.height),
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                'Browse all',
                style: ProductTheme.textTheme.subtitle1,
              ),
            ),
            GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: context.width / (0.3 * context.height),
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                children: [
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                  GenreCards(
                    backgroundColor: Colors.lime.shade800,
                    genreImageURL:
                        "https://dstudiosmedia.com/wp-content/uploads/2021/08/top-10-most-followed-playlists-for-hip-hop-rap-music-on-spotify-1.jpg",
                    genreName: 'Hip-Hop',
                  ),
                ])
          ]),
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
