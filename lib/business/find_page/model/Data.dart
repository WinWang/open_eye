import 'Label.dart';

class Data {
  Data({
      this.dataType, 
      this.id, 
      this.title, 
      this.description, 
      this.image, 
      this.actionUrl, 
      this.shade, 
      this.label, 
      this.autoPlay,});

  Data.fromJson(dynamic json) {
    dataType = json['dataType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    actionUrl = json['actionUrl'];
    shade = json['shade'];
    label = json['label'] != null ? Label.fromJson(json['label']) : null;
    autoPlay = json['autoPlay'];
  }
  String? dataType;
  int? id;
  String? title;
  String? description;
  String? image;
  String? actionUrl;
  bool? shade;
  Label? label;
  bool? autoPlay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dataType'] = dataType;
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['actionUrl'] = actionUrl;
    map['shade'] = shade;
    if (label != null) {
      map['label'] = label?.toJson();
    }
    map['autoPlay'] = autoPlay;
    return map;
  }

}