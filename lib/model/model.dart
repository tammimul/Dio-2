import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name : "id")
   int id;
  @JsonKey(name : "email")
   String email;
  @JsonKey(name : "first_name")
   String first_name;
  @JsonKey(name : "last_name")
   String last_name;
  @JsonKey(name : "avatar")
   String avatar;

  User(this.id,this.email, this.first_name,this.last_name, this.avatar);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}