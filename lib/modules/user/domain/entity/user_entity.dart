import 'package:equatable/equatable.dart';
import 'package:q_bank/core/core.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? email;
  final String? phoneNumber;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final Gender? gender;
  final String? profilePic;
  final DateTime? dob;
  final bool? phoneVerified;
  final bool? emailVerified;
  final String? referalCode;
  final String? rudrakxPoints;

  const UserEntity({
    this.id,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.profilePic,
    this.dob,
    this.phoneVerified,
    this.emailVerified,
    this.referalCode,
    this.rudrakxPoints,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    phoneNumber,
    firstName,
    middleName,
    lastName,
    gender,
    profilePic,
    dob,
    phoneVerified,
    emailVerified,
    referalCode,
    rudrakxPoints,
  ];
}
