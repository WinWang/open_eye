// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Header_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderEntity _$HeaderEntityFromJson(Map<String, dynamic> json) => HeaderEntity(
      id: json['id'] as int?,
      icon: json['icon'] as String?,
      iconType: json['iconType'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'],
      description: json['description'] as String?,
      actionUrl: json['actionUrl'] as String?,
      adTrack: json['adTrack'],
      follow: json['follow'] == null
          ? null
          : Follow.fromJson(json['follow'] as Map<String, dynamic>),
      ifPgc: json['ifPgc'] as bool?,
      uid: json['uid'] as int?,
      ifShowNotificationIcon: json['ifShowNotificationIcon'] as bool?,
      expert: json['expert'] as bool?,
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => ItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeaderEntityToJson(HeaderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'iconType': instance.iconType,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'actionUrl': instance.actionUrl,
      'adTrack': instance.adTrack,
      'follow': instance.follow?.toJson(),
      'ifPgc': instance.ifPgc,
      'uid': instance.uid,
      'ifShowNotificationIcon': instance.ifShowNotificationIcon,
      'expert': instance.expert,
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
    };
