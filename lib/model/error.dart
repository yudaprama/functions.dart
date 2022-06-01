import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));
String errorToJson(Error data) => json.encode(data.toJson());

@freezed
class Error with _$Error {
  const factory Error({
    required String error,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
