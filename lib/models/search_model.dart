import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'search_model.g.dart';

@JsonSerializable(createToJson: false)
class SearchModel extends INetworkModel {
  String? title;
  String? imageURL;
  int? backgroundColor;

  SearchModel({this.title, this.imageURL, this.backgroundColor});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$SearchModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}
