import 'package:spotify_clone_app/models/album_model.dart';
import 'package:spotify_clone_app/models/recently_items_model.dart';
import 'package:spotify_clone_app/models/search_model.dart';
import 'package:vexana/vexana.dart';
import '../models/podcast_model.dart';

abstract class ISpotifyService {
  final INetworkManager networkManager;

  ISpotifyService(this.networkManager);

  Future<List<AlbumModel>?> fetchSpotifyAlbumDatas();
  Future<List<PodcastModel>?> fetchSpotifyPodcastDatas();
  Future<List<RecentlyItemsModel>?> fetchSpotifyRecentlDatas();
  Future<List<SearchModel>?> fetchSpotifySearchDatas();
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
  Future<List<SearchModel>?> fetchSpotifySearchDatas() async {
    final response = await networkManager.send<SearchModel, List<SearchModel>>(ServicePaths.search.path,
        parseModel: SearchModel(), method: RequestType.GET);
    return response.data;
  }
}

enum ServicePaths { albums, podcasts, recentlySongs, search }

extension ServicePathsExtension on ServicePaths {
  String get path => name;
}
