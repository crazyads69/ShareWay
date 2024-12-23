import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/core/utils/enums/gender_enum.dart';
import 'package:share_way_frontend/data/api/user/response/user_response/user_response.dart';
part 'app_user.g.dart';

@CopyWith()
class AppUser {
  DateTime? createdAt;
  String? email;
  String? fullName;
  String? id;
  bool? isActivated;
  bool? isVerified;
  String? phoneNumber;
  String? role;
  DateTime? updatedAt;
  String? avatarUrl;
  double? averageRating;
  GenderEnum gender;

  AppUser({
    this.createdAt,
    this.email,
    this.fullName,
    this.id,
    this.isActivated,
    this.isVerified,
    this.phoneNumber,
    this.role,
    this.updatedAt,
    this.avatarUrl,
    this.averageRating,
    this.gender = GenderEnum.MALE,
  });

  factory AppUser.fromApiModel(UserResponse data) {
    return AppUser(
      createdAt: data.createdAt,
      email: data.email,
      fullName: data.fullName,
      id: data.id,
      isActivated: data.isActivated,
      isVerified: data.isVerified,
      phoneNumber: data.phoneNumber,
      role: data.role,
      updatedAt: data.updatedAt,
      avatarUrl: data.avatarUrl,
      averageRating: data.averageRating,
      gender: GenderEnum.fromString(data.gender ?? ''),
    );
  }
}
