import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'podcast_model.g.dart';

@JsonSerializable(createToJson: false)
class PodcastModel extends INetworkModel {
  int? podcastId;
  String? title;
  String? subtitle;
  String? url;
  String? thumbnailUrl;

  PodcastModel({this.podcastId, this.title, this.subtitle, this.url, this.thumbnailUrl});

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return _$PodcastModelFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$PodcastModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}
