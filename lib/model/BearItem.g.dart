// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BearItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BearList _$BearListFromJson(Map<String, dynamic> json) {
  return BearList(
    list: (json['list'] as List<dynamic>?)
        ?.map((e) => BearItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BearListToJson(BearList instance) => <String, dynamic>{
      'list': instance.list,
    };

BearItem _$BearItemFromJson(Map<String, dynamic> json) {
  return BearItem(
    image: json['image'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$BearItemToJson(BearItem instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
    };
