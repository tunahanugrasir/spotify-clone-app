import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:spotify_clone_app/product/theme/product_theme.dart';

import '../../features/view_model/home_view_model.dart';
import '../../utilities/project_utils.dart';

class MoodsArea extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const MoodsArea({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const PaddingUtils.onlyTop(),
        itemCount: homeViewModel.podcastModelItems.length,
        itemBuilder: (context, index) {
          var albumModelItems = homeViewModel.albumModelItems[index];
          return AlbumCard(
              title: albumModelItems.title ?? '',
              thumbnailUrl: albumModelItems.thumbnailUrl ?? '',
              deepUrl: albumModelItems.url ?? '');
        },
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String deepUrl;
  const AlbumCard({Key? key, required this.title, required this.thumbnailUrl, required this.deepUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.podcastsAndSongs(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _albumImage(context),
          _albumTitle(context),
        ],
      ),
    );
  }

  Padding _albumTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: SizedBox(
        width: context.width * 0.4,
        child: Text(
          title,
          style: ProductTheme.textTheme.headline1,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Container _albumImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              thumbnailUrl,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
