// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/album_model.dart';
import '../../models/podcast_model.dart';
import '../../service/spotify_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final ISpotifyService spotifyService;

  @observable
  List<AlbumModel> albumModelItems = [];
  @observable
  List<PodcastModel> podcastModelItems = [];
  @observable
  bool isLoading = false;

  _HomeViewModelBase(this.spotifyService);

  @action
  Future<void> fetchAllDatas() async {
    _changeLoading();
    final albumResponse = await spotifyService.fetchSpotifyAlbumDatas();
    final podcastResponse = await spotifyService.fetchSpotifyPodcastDatas();
    albumModelItems = albumResponse ?? [];
    podcastModelItems = podcastResponse ?? [];
    inspect(albumModelItems);
    inspect(podcastModelItems);
    _changeLoading();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }
}
