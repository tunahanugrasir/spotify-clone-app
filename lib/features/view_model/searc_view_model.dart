// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:spotify_clone_app/features/features_index.dart';
import 'package:spotify_clone_app/models/types_model.dart';
part 'searc_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store {
  final ISpotifyService spotifyService;
  @observable
  List<TypeModel> typeItems = [];
  @observable
  bool isLoading = false;

  _SearchViewModelBase(this.spotifyService);

  @action
  Future<void> fetchAllTypes() async {
    _changeLoading();
    final typesResponse = await spotifyService.fetchSpotifyTypesDatas();
    typeItems = typesResponse ?? [];
    _changeLoading();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }
}
