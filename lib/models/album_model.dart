import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'album_model.g.dart';

@JsonSerializable(createToJson: false)
class AlbumModel extends INetworkModel {
  int? albumId;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumModel({this.albumId, this.title, this.url, this.thumbnailUrl});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return _$AlbumModelFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$AlbumModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}
