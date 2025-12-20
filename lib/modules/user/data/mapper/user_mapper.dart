import 'dart:convert';

import 'package:q_bank/modules/user/user.dart';

class UserMapper {
  /// Model → Entity
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      address: model.address,
      email: model.email,
      isActive: model.isActive,
      emailVerifiedAt: model.emailVerifiedAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Entity → Model
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      email: entity.email,
      isActive: entity.isActive,
      emailVerifiedAt: entity.emailVerifiedAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// JSON → Entity
  static UserEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(UserModel.fromJson(json));
  }

  static UserEntity fromRawJsonToEntity(String rawJson) {
    return toEntity(UserModel.fromJson(jsonDecode(rawJson)));
  }

  /// Entity → JSON
  static Map<String, dynamic> toJsonFromEntity(UserEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(UserEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }
}
