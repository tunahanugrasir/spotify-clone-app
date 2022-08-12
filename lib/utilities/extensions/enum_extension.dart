import 'package:flutter/material.dart';

enum AssetImages { currentMusic }

extension ImagesAddPath on AssetImages {
  String addPath() {
    switch (this) {
      case AssetImages.currentMusic:
        return 'assets/images/ic_current_music.jpg';
    }
  }

  Widget getImage() {
    return Image.asset(addPath());
  }
}

enum AssetMusicPath { music }

extension AssetMusicPathExtension on AssetMusicPath {
  String get musicPath => 'assets/sounds/mutlu_ol_yeter.mp3';
}

enum SearchViewTexts { hintText, search, browse, genres }

extension SearchViewTextsExtension on SearchViewTexts {
  getText() {
    switch (this) {
      case SearchViewTexts.hintText:
        return 'Artists, songs, or podcasts';
      case SearchViewTexts.search:
        return 'Search';
      case SearchViewTexts.browse:
        return 'Browse all';
      case SearchViewTexts.genres:
        return 'Your top genres';
    }
  }
}
