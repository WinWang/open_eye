// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dataType: json['dataType'] as String?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      library: json['library'] as String?,
      consumption: json['consumption'] == null
          ? null
          : Consumption.fromJson(json['consumption'] as Map<String, dynamic>),
      resourceType: json['resourceType'] as String?,
      provider: json['provider'] == null
          ? null
          : Provider.fromJson(json['provider'] as Map<String, dynamic>),
      category: json['category'] as String?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      cover: json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
      playUrl: json['playUrl'] as String?,
      duration: json['duration'] as int?,
      webUrl: json['webUrl'] == null
          ? null
          : WebUrl.fromJson(json['webUrl'] as Map<String, dynamic>),
      releaseTime: json['releaseTime'] as int?,
      ad: json['ad'] as bool?,
      type: json['type'] as String?,
      descriptionPgc: json['descriptionPgc'] as String?,
      remark: json['remark'] as String?,
      ifLimitVideo: json['ifLimitVideo'] as bool?,
      searchWeight: json['searchWeight'] as int?,
      idx: json['idx'] as int?,
      date: json['date'] as int?,
      descriptionEditor: json['descriptionEditor'] as String?,
      collected: json['collected'] as bool?,
      reallyCollected: json['reallyCollected'] as bool?,
      played: json['played'] as bool?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'library': instance.library,
      'consumption': instance.consumption?.toJson(),
      'resourceType': instance.resourceType,
      'provider': instance.provider?.toJson(),
      'category': instance.category,
      'author': instance.author?.toJson(),
      'cover': instance.cover?.toJson(),
      'playUrl': instance.playUrl,
      'duration': instance.duration,
      'webUrl': instance.webUrl?.toJson(),
      'releaseTime': instance.releaseTime,
      'ad': instance.ad,
      'type': instance.type,
      'descriptionPgc': instance.descriptionPgc,
      'remark': instance.remark,
      'ifLimitVideo': instance.ifLimitVideo,
      'searchWeight': instance.searchWeight,
      'idx': instance.idx,
      'date': instance.date,
      'descriptionEditor': instance.descriptionEditor,
      'collected': instance.collected,
      'reallyCollected': instance.reallyCollected,
      'played': instance.played,
      'image': instance.image,
    };
