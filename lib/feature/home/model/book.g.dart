part of 'book.dart';

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      description: json['description'] as String,
      preview: json['preview'] as String);
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'preview': instance.preview
    };
