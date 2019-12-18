import 'package:json_annotation/json_annotation.dart';

part 'Book.g.dart';

@JsonSerializable()
class Book {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'subTitle')
  final String subTitle;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'preview')
  final String preview;

  Book({this.id, this.title, this.subTitle, this.description, this.preview});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
