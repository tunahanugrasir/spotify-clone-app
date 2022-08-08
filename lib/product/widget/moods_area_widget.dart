import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../features/view_model/home_view_model.dart';

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
        padding: const EdgeInsets.only(top: 16),
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
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    thumbnailUrl,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: SizedBox(
              width: context.width * 0.4,
              child: Text(
                title,
                style: context.textTheme.subtitle2?.copyWith(fontWeight: FontWeight.normal, color: Colors.white70),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
