import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(top: 16),
        itemCount: homeViewModel.podcastModelItems.length,
        itemBuilder: (context, index) {
          var podcastModelItem = homeViewModel.podcastModelItems[index];
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
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white38),
          )
        ],
      ),
    );
  }
}
