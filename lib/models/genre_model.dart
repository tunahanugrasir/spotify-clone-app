import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part "genre_model.g.dart";

@JsonSerializable(createToJson: false)
class GenreModel extends INetworkModel {
  String? title;
  String? imageURL;
  List<int>? backgroundColor;

  GenreModel({this.title, this.imageURL, this.backgroundColor});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return _$GenreModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$GenreModelFromJson(json);
  }
}
