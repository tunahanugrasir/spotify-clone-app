import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:spotify_clone_app/product/theme/product_theme.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                _searchTitleAndCameraIcon(),
                _pinnedSearchBox(),
              ];
            }),
            body: ListView(padding: EdgeInsets.zero, physics: const BouncingScrollPhysics(), children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                child: Row(
                  children: const [
                    RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.compare_arrows_rounded),
                    ),
                    Text(
                      "Most Recent",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.grid_view)
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 10,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                        child: SizedBox(
                          height: 75,
                          child: Card(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: context.height,
                                    width: context.width,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://community.spotify.com/t5/image/serverpage/image-id/104727iC92B541DB372FBC7/image-size/large?v=v2&px=999",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Liked Songs",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Transform.rotate(
                                                angle: (240 / 360),
                                                child: const Icon(
                                                  Icons.push_pin,
                                                  color: Color(0xff1DB954),
                                                )),
                                            const Text("Playlist • 637 songs")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ])));
  }

  SliverAppBar _pinnedSearchBox() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      collapsedHeight: 0,
      toolbarHeight: 0,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white70, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      "Playlists",
                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white70, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      "Albums",
                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white70, width: 1),
                ),
                child: const Center(
                  child: Text(
                    "Podcast & Shows",
                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _searchTitleAndCameraIcon() {
    return SliverAppBar(
      backgroundColor: ColorsScheme.primary,
      pinned: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/58215634?v=4",
          ),
        ),
      ),
      title: const Text("Your Library"),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search),
              ),
              Icon(Icons.add)
            ],
          ),
        ),
      ],
    );
  }
}
