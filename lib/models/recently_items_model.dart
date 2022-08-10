import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'recently_items_model.g.dart';

@JsonSerializable(createToJson: false)
class RecentlyItemsModel extends INetworkModel {
  String? title;
  String? url;

  RecentlyItemsModel({this.title, this.url});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$RecentlyItemsModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}
