import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part "types_model.g.dart";

@JsonSerializable(createToJson: false)
class TypeModel extends INetworkModel {
  String? title;
  String? imageURL;
  List<int>? backgroundColor;

  TypeModel({this.title, this.imageURL, this.backgroundColor});

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return _$TypeModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$TypeModelFromJson(json);
  }
}
