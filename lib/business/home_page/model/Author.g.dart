// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      id: json['id'] as int?,
      icon: json['icon'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      link: json['link'] as String?,
      latestReleaseTime: json['latestReleaseTime'] as int?,
      videoNum: json['videoNum'] as int?,
      follow: json['follow'] == null
          ? null
          : Follow.fromJson(json['follow'] as Map<String, dynamic>),
      shield: json['shield'] == null
          ? null
          : Shield.fromJson(json['shield'] as Map<String, dynamic>),
      approvedNotReadyVideoCount: json['approvedNotReadyVideoCount'] as int?,
      ifPgc: json['ifPgc'] as bool?,
      recSort: json['recSort'] as int?,
      expert: json['expert'] as bool?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'description': instance.description,
      'link': instance.link,
      'latestReleaseTime': instance.latestReleaseTime,
      'videoNum': instance.videoNum,
      'follow': instance.follow?.toJson(),
      'shield': instance.shield?.toJson(),
      'approvedNotReadyVideoCount': instance.approvedNotReadyVideoCount,
      'ifPgc': instance.ifPgc,
      'recSort': instance.recSort,
      'expert': instance.expert,
    };
