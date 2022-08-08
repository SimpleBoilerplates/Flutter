import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

Token tokenFromJson(String str) =>
    Token.fromJson(json.decode(str) as Map<String, dynamic>);

String tokenToJson(Token data) => json.encode(data.toJson());

@freezed
class Token with _$Token {
  const factory Token({
    required String token,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
