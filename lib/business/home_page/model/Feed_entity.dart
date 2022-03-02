import 'package:json_annotation/json_annotation.dart';
import 'IssueList.dart';

part 'Feed_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedEntity {
  FeedEntity(
      {this.issueList,
      this.nextPageUrl,
      this.nextPublishTime,
      this.newestIssueType,
      this.date});

  List<IssueList>? issueList;
  String? nextPageUrl;
  int? nextPublishTime;
  String? newestIssueType;
  int? date;

  factory FeedEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedEntityToJson(this);
}
