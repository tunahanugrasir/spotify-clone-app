import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'library_model.g.dart';

@JsonSerializable(createToJson: false)
class LibraryModel extends INetworkModel {
  String? title;
  String? subtitle;
  bool? pinned;
  String? image;

  LibraryModel({this.title, this.subtitle, this.pinned, this.image});

  factory LibraryModel.fromJson(Map<String, dynamic> json) {
    return _$LibraryModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$LibraryModelFromJson(json);
  }
}
