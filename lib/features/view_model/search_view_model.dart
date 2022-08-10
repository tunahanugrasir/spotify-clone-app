// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:spotify_clone_app/models/search_model.dart';
import 'package:spotify_clone_app/service/spotify_service.dart';
part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store {
  final ISpotifyService spotifyService;
  @observable
  List<SearchModel> searchItems = [];
  _SearchViewModelBase(this.spotifyService);

  Future<void>? fetchAllData() async {
    final searchResponse = await spotifyService.fetchSpotifySearchDatas();
    searchItems = searchResponse ?? [];
  }
}
