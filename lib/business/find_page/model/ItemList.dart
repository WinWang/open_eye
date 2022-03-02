import 'Data.dart';

class ItemList {
  ItemList({
      this.type, 
      this.data, 
      this.trackingData, 
      this.tag, 
      this.id, 
      this.adIndex,});

  ItemList.fromJson(dynamic json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    trackingData = json['trackingData'];
    tag = json['tag'];
    id = json['id'];
    adIndex = json['adIndex'];
  }
  String? type;
  Data? data;
  dynamic trackingData;
  dynamic tag;
  int? id;
  int? adIndex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['trackingData'] = trackingData;
    map['tag'] = tag;
    map['id'] = id;
    map['adIndex'] = adIndex;
    return map;
  }

}