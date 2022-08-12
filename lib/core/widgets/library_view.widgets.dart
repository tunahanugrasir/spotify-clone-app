import 'package:flutter/material.dart';

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
