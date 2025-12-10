import 'dart:convert';

class UserModel {
  final int? id;
  final String? email;
  final String? phoneNumber;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final String? profilePic;
  final String? dob;
  final bool? phoneVerified;
  final bool? emailVerified;
  final String? referalCode;
  final String? rudrakxPoints;

  UserModel({
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

  UserModel copyWith({
    int? id,
    String? email,
    String? phoneNumber,
    String? firstName,
    String? middleName,
    String? lastName,
    String? gender,
    String? profilePic,
    String? dob,
    bool? phoneVerified,
    bool? emailVerified,
    String? referalCode,
    String? rudrakxPoints,
  }) => UserModel(
    id: id ?? this.id,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    firstName: firstName ?? this.firstName,
    middleName: middleName ?? this.middleName,
    lastName: lastName ?? this.lastName,
    gender: gender ?? this.gender,
    profilePic: profilePic ?? this.profilePic,
    dob: dob ?? this.dob,
    phoneVerified: phoneVerified ?? this.phoneVerified,
    emailVerified: emailVerified ?? this.emailVerified,
    referalCode: referalCode ?? this.referalCode,
    rudrakxPoints: rudrakxPoints ?? this.rudrakxPoints,
  );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    firstName: json["first_name"],
    middleName: json["middle_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    profilePic: json["profile_pic"],
    dob: json["dob"],
    phoneVerified: json["phone_verified"],
    emailVerified: json["email_verified"],
    referalCode: json["referal_code"],
    rudrakxPoints: json["rudrakx_points"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone_number": phoneNumber,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "gender": gender,
    "profile_pic": profilePic,
    "dob": dob,
    "phone_verified": phoneVerified,
    "email_verified": emailVerified,
    "referal_code": referalCode,
    "rudrakx_points": rudrakxPoints,
  };
}
