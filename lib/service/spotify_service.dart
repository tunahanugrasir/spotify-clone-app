import 'package:spotify_clone_app/models/album_model.dart';
import 'package:vexana/vexana.dart';
import '../models/podcast_model.dart';

abstract class ISpotifyService {
  final INetworkManager networkManager;

  ISpotifyService(this.networkManager);

  Future<List<AlbumModel>?> fetchSpotifyAlbumDatas();
  Future<List<PodcastModel>?> fetchSpotifyPodcastDatas();
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
}

enum ServicePaths { albums, podcasts }

extension ServicePathsExtension on ServicePaths {
  String get path => name;
}
