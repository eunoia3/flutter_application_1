import 'package:json_annotation/json_annotation.dart';

part 'BearItem.g.dart';

@JsonSerializable()
class BearList {
  List<BearItem>? list;

  BearList({
    required this.list,
  });

  factory BearList.fromJson(Map<String, dynamic> json) =>
      _$BearListFromJson(json);

  Map<String, dynamic> toJson() => _$BearListToJson(this);
}

@JsonSerializable()
class BearItem {
  int? index;
  String? image;
  String? name;

  BearItem({
    required this.index,
    required this.image,
    required this.name,
  });

  factory BearItem.fromJson(Map<String, dynamic> json) =>
      _$BearItemFromJson(json);

  Map<String, dynamic> toJson() => _$BearItemToJson(this);
}
