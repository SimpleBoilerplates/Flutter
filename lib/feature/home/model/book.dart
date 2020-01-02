import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable {
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

  // Equatable
  @override
  List<Object> get props => [id, title, subTitle, description, preview];

  @override
  String toString() => 'Post { id: $id }';
}
