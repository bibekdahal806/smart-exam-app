import 'package:q_bank/modules/user/user.dart';

abstract class EditProfileRepository {
  Future<void> editUserData({required UserEntity entity, String? imagePath});
}
