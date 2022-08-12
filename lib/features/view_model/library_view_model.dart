// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import '../../models/library_model.dart';
import '../../service/spotify_service.dart';

part 'library_view_model.g.dart';

class LibraryViewModel = _LibraryViewModelBase with _$LibraryViewModel;

abstract class _LibraryViewModelBase with Store {
  final ISpotifyService spotifyService;

  @observable
  List<LibraryModel> libraryModelItems = [];
  @observable
  bool isLoading = false;

  _LibraryViewModelBase(this.spotifyService);

  @action
  Future<void> fetchAllData() async {
    _changeLoading();
    final libraryItemsResponse = await spotifyService.fetchSpotifyLibraryDatas();
    libraryModelItems = libraryItemsResponse ?? [];
    _changeLoading();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }
}
