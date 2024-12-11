import 'package:json_annotation/json_annotation.dart';

part 'history_ride_driver_response.g.dart';

@JsonSerializable()
class HistoryRideDriverResponse {
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'average_rating')
  double? averageRating;
  @JsonKey(name: 'balance_in_app')
  int? balanceInApp;
  @JsonKey(name: 'full_name')
  String? fullName;
  String? gender;
  @JsonKey(name: 'is_momo_linked')
  bool? isMomoLinked;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  HistoryRideDriverResponse({
    this.avatarUrl,
    this.averageRating,
    this.balanceInApp,
    this.fullName,
    this.gender,
    this.isMomoLinked,
    this.phoneNumber,
    this.userId,
  });

  factory HistoryRideDriverResponse.fromJson(Map<String, dynamic> json) {
    return _$HistoryRideDriverResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryRideDriverResponseToJson(this);
}
