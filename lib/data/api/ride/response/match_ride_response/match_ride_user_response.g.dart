// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_ride_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchRideUserResponse _$MatchRideUserResponseFromJson(
        Map<String, dynamic> json) =>
    MatchRideUserResponse(
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$MatchRideUserResponseToJson(
        MatchRideUserResponse instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
      'avatar_url': instance.avatarUrl,
      'average_rating': instance.averageRating,
      'gender': instance.gender,
    };
