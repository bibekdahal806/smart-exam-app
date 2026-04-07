import 'package:q_bank/modules/user/user.dart';

abstract class AuthRepository {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> registerUser({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String address,
    required String password,
  });

  //get user state. if user is null then user is not logged in
  Stream<UserEntity?> getCurrentAuthUserState();

  //get currently logged in user
  Future<UserEntity?> getLoggedInUser();

  Future<void> forgetPassword({required String email});

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  });

  //logout user from database and local storage
  Future<void> logout({bool? isStillAuthenticated});
}
