import 'package:flutter/material.dart';

import '../../features/views/home_view.dart';
import '../../features/views/library_view.dart';
import '../../features/views/search_view.dart';

enum BottomNavBar { home, search, yourLibrary }

extension SpotifTextsExtension on BottomNavBar {
  String getText() {
    switch (this) {
      case BottomNavBar.home:
        return 'Home';
      case BottomNavBar.search:
        return 'Search';
      case BottomNavBar.yourLibrary:
        return 'Your Library';
    }
  }

  IconData getIcon() {
    switch (this) {
      case BottomNavBar.home:
        return Icons.home;
      case BottomNavBar.search:
        return Icons.search;
      case BottomNavBar.yourLibrary:
        return Icons.library_books_outlined;
    }
  }
}

extension SpotifyChangePages on BottomNavBar {
  Widget getPages(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SearchView();
      case 2:
        return const LibraryView();
    }
    return const HomeView();
  }
}

enum TitlesAndSubtitles {
  goodMorning,
  goodAfternoon,
  goodEvening,
  goodNight,
  yourShows,
  recentlyPlayed,
  yourTopMixes,
  pop,
  mood,
  hipHop
}

extension TitlesAndSubtitlesExtension on TitlesAndSubtitles {
  getString() {
    switch (this) {
      case TitlesAndSubtitles.goodMorning:
        return 'Good morning';
      case TitlesAndSubtitles.goodAfternoon:
        return 'Good afternoon';
      case TitlesAndSubtitles.goodEvening:
        return 'Good evening';
      case TitlesAndSubtitles.goodNight:
        return 'Good night';
      case TitlesAndSubtitles.yourShows:
        return 'Your shows';
      case TitlesAndSubtitles.recentlyPlayed:
        return 'Recently played';
      case TitlesAndSubtitles.yourTopMixes:
        return 'Your top mixes';
      case TitlesAndSubtitles.pop:
        return 'Pop';
      case TitlesAndSubtitles.mood:
        return 'Mood';
      case TitlesAndSubtitles.hipHop:
        return 'Hip Hop';
    }
  }
}
