import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../features/view_model/library_view_model.dart';
import '../../product/constants/constants_index.dart';
import '../../product/theme/product_theme.dart';
import '../../utilities/project_utils.dart';

class SliverCategories extends StatelessWidget {
  const SliverCategories({Key? key}) : super(key: key);
  final double collapsedHeight = 0;
  final double toolbarHeight = 0;
  final bool _pinned = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorsScheme.primary,
      collapsedHeight: collapsedHeight,
      toolbarHeight: toolbarHeight,
      pinned: _pinned,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
            padding: const PaddingUtils.libraryViewSpaceBar(),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _Title(text: LibraryCategories.playlists.getNames()),
                _Title(text: LibraryCategories.albums.getNames()),
                _Title(text: LibraryCategories.podcastAndShows.getNames()),
              ],
            )),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  const _Title({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.onlyRight(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsScheme.grey, width: 1),
        ),
        child: Center(
          child: Padding(
            padding: const PaddingUtils.normal(),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: ColorsScheme.secondary, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderAndIcons extends StatelessWidget with ProductSetup {
  HeaderAndIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorsScheme.primary,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            profileImage,
          ),
        ),
      ),
      title: Text(leading),
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

class LibraryItem extends StatelessWidget {
  const LibraryItem({
    Key? key,
    required this.libraryViewModel,
    required this.isPinned,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final LibraryViewModel libraryViewModel;
  final bool isPinned;
  final String image;
  final String title;
  final String subTitle;
  final double _angle = (240 / 360);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.libraryViewSymetric(),
      child: SizedBox(
        height: context.height * 0.1,
        child: Card(
          color: ColorsScheme.transparent,
          child: Row(
            children: [
              Expanded(
                flex: ExpandedUtils.mediumFlex,
                child: Container(
                  height: context.height,
                  width: context.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: ExpandedUtils.maxFlex,
                child: Padding(
                  padding: const PaddingUtils.onlyLeftEight(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: ColorsScheme.secondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const PaddingUtils.onlyTopFour(),
                        child: Row(
                          children: [
                            Padding(
                              padding: isPinned ? const PaddingUtils.onlyRightFour() : const PaddingUtils.zero(),
                              child: Transform.rotate(
                                  angle: _angle,
                                  child: isPinned
                                      ? const Icon(
                                          Icons.push_pin,
                                          color: ColorsScheme.spotifyGreen,
                                          size: IconUtils.iconSizeSmall,
                                        )
                                      : const SizedBox()),
                            ),
                            Text(
                              subTitle,
                              style: const TextStyle(color: ColorsScheme.subtitle, fontSize: 14),
                            )
                          ],
                        ),
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
  }
}
