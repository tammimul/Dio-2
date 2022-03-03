// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singleuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleUSerresponse _$SingleUSerresponseFromJson(Map<String, dynamic> json) =>
    SingleUSerresponse(
      User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleUSerresponseToJson(SingleUSerresponse instance) =>
    <String, dynamic>{
      'data': instance.user,
    };
