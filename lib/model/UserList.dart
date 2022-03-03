import 'package:json_annotation/json_annotation.dart';
import 'package:let/model/model.dart';

part 'UserList.g.dart';

@JsonSerializable()

class UserList{
  @JsonKey(name : "page")
   int page;

  @JsonKey(name : "per_page")
  int per_page;

  @JsonKey(name : "total")
  int total;

  @JsonKey(name : "total_pages")
  int total_pages;

  @JsonKey(name : "data")

  List<User> users;


  //UserList(this.page,this.per_page,this.total,this.total_pages);


  UserList(this.page,this.per_page, this.total,this.total_pages, this.users);

  factory UserList.fromJson(Map<String, dynamic> json) => _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);
}