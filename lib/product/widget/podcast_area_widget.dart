import 'package:flutter/material.dart';
import 'package:spotify_clone_app/models/podcast_model.dart';
import 'package:spotify_clone_app/product/theme/product_theme.dart';
import 'package:spotify_clone_app/utilities/project_utils.dart';

import '../../features/view_model/home_view_model.dart';

class PodcastArea extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const PodcastArea({
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
          PodcastModel podcastModelItem = homeViewModel.podcastModelItems[index];
          return Podcast(
              imageURL: podcastModelItem.thumbnailUrl ?? '',
              title: podcastModelItem.title ?? '',
              subtitle: podcastModelItem.subtitle ?? '');
        },
      ),
    );
  }
}

class Podcast extends StatelessWidget {
  final String imageURL;
  final String title;
  final String subtitle;
  const Podcast({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.podcastsAndSongs(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_podcastImage(context), _podcastTitle(context), _podcastSubtitle()],
      ),
    );
  }

  Text _podcastSubtitle() {
    return Text(
      subtitle,
      style: ProductTheme.textTheme.headline3,
    );
  }

  Padding _podcastTitle(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.podcastAndText(),
      child: Text(
        title,
        style: ProductTheme.textTheme.headline2,
      ),
    );
  }

  Container _podcastImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(
              imageURL,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
