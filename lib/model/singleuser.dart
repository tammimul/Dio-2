import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'singleuser.g.dart';

@JsonSerializable()


class SingleUSerresponse{
  SingleUSerresponse(this.user);
  @JsonKey(name : "data")
  User user;

  factory SingleUSerresponse.fromJson(Map<String, dynamic> json) => _$SingleUSerresponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUSerresponseToJson(this);
}