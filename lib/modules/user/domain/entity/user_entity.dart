import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? address;
  final String? email;
  final bool? isActive;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.isActive,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phone,
    address,
    email,
    isActive,
    emailVerifiedAt,
    createdAt,
    updatedAt,
  ];
}
