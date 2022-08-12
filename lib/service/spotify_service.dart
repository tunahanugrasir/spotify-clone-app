import 'package:vexana/vexana.dart';

import '../models/album_model.dart';
import '../models/genre_model.dart';
import '../models/library_model.dart';
import '../models/podcast_model.dart';
import '../models/recently_items_model.dart';

abstract class ISpotifyService {
  final INetworkManager networkManager;

  ISpotifyService(this.networkManager);

  Future<List<AlbumModel>?> fetchSpotifyAlbumDatas();
  Future<List<PodcastModel>?> fetchSpotifyPodcastDatas();
  Future<List<RecentlyItemsModel>?> fetchSpotifyRecentlDatas();
  Future<List<GenreModel>?> fetchSpotifyTypesDatas();
  Future<List<LibraryModel>?> fetchSpotifyLibraryDatas();
}

class SpotifyService extends ISpotifyService {
  SpotifyService(super.networkManager);

  @override
  Future<List<AlbumModel>?> fetchSpotifyAlbumDatas() async {
    final response = await networkManager.send<AlbumModel, List<AlbumModel>>(ServicePaths.albums.path,
        parseModel: AlbumModel(), method: RequestType.GET);
    return response.data;
  }

  @override
  Future<List<PodcastModel>?> fetchSpotifyPodcastDatas() async {
    final response = await networkManager.send<PodcastModel, List<PodcastModel>>(ServicePaths.podcasts.path,
        parseModel: PodcastModel(), method: RequestType.GET);
    return response.data;
  }

  @override
  Future<List<RecentlyItemsModel>?> fetchSpotifyRecentlDatas() async {
    final response = await networkManager.send<RecentlyItemsModel, List<RecentlyItemsModel>>(
        ServicePaths.recentlySongs.path,
        parseModel: RecentlyItemsModel(),
        method: RequestType.GET);
    return response.data;
  }

  @override
  Future<List<GenreModel>?> fetchSpotifyTypesDatas() async {
    final response = await networkManager.send<GenreModel, List<GenreModel>>(ServicePaths.types.path,
        parseModel: GenreModel(), method: RequestType.GET);
    return response.data;
  }

  @override
  Future<List<LibraryModel>?> fetchSpotifyLibraryDatas() async {
    final response = await networkManager.send<LibraryModel, List<LibraryModel>>(ServicePaths.library.path,
        parseModel: LibraryModel(), method: RequestType.GET);
    return response.data;
  }
}

enum ServicePaths { albums, podcasts, recentlySongs, types, library }

extension ServicePathsExtension on ServicePaths {
  String get path => name;
}
