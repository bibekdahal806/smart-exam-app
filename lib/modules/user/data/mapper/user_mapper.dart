import 'dart:convert';

import 'package:q_bank/modules/user/user.dart';

class UserMapper {
  /// Convert `UserModel` to `UserEntity`

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      phoneNumber: model.phoneNumber.toString(),
      firstName: model.firstName,
      middleName: model.middleName,
      lastName: model.lastName,
      gender: model.gender == null
          ? null
          : GenderExtension.fromGenderCode(model.gender?.toLowerCase() ?? ""),
      profilePic: model.profilePic,
      dob: DateTime.tryParse(model.dob ?? ""),
      phoneVerified: model.phoneVerified,
      emailVerified: model.emailVerified,
      referalCode: model.referalCode,
      rudrakxPoints: model.rudrakxPoints,
    );
  }

  /// Convert `UserEntity` to `UserModel`
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      firstName: entity.firstName,
      middleName: entity.middleName,
      lastName: entity.lastName,
      gender: entity.gender?.toGenderCode.toUpperCase(),
      profilePic: entity.profilePic,
      dob: entity.dob?.toIso8601String(),
      phoneVerified: entity.phoneVerified,
      emailVerified: entity.emailVerified,
      referalCode: entity.referalCode,
      rudrakxPoints: entity.rudrakxPoints,
    );
  }

  /// Convert JSON to [UserEntity]
  static UserEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(UserModel.fromJson(json));
  }

  static UserEntity fromRawJsonToEntity(String rawEntity) {
    return toEntity(UserModel.fromJson(jsonDecode(rawEntity)));
  }

  /// Convert [UserEntity] to JSON
  static Map<String, dynamic> toJsonFromEntity(UserEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(UserEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }
}
