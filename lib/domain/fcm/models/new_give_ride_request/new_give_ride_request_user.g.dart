// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_give_ride_request_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewGiveRideRequestUser _$NewGiveRideRequestUserFromJson(
        Map<String, dynamic> json) =>
    NewGiveRideRequestUser(
      id: json['user_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$NewGiveRideRequestUserToJson(
        NewGiveRideRequestUser instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'phone_number': instance.phoneNumber,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'average_rating': instance.averageRating,
      'gender': instance.gender,
    };
