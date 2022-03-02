class Label {
  Label({
      this.text, 
      this.card, 
      this.detail,});

  Label.fromJson(dynamic json) {
    text = json['text'];
    card = json['card'];
    detail = json['detail'];
  }
  String? text;
  String? card;
  dynamic detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['card'] = card;
    map['detail'] = detail;
    return map;
  }

}