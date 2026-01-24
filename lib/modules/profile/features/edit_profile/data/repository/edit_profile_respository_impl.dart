import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:q_bank/modules/user/user.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  EditProfileRepositoryImpl();

  final RemoteService _remoteService = getIt<RemoteService>();
  final UserSessionRepository _userSessionRepository =
      getIt<UserSessionRepository>();
  @override
  Future<void> editUserData({
    required UserEntity entity,
    String? imagePath,
  }) async {
    return Future.delayed(const Duration(seconds: 1));
    // var userJsonData = UserMapper.toJsonFromEntity(entity)
    //   ..removeWhere((key, value) => value == null);
    // userJsonData["dob"] = entity.dob?.formattedDate;
    // userJsonData.removeWhere((key, value) => key == "profile_pic_detail");
    // try {
    //   if (imagePath != null) {
    //     var response = await _remoteService.postResponse(
    //       endPoint: ApiRoutes.uploadImageEndPoint,
    //       isTokenRequired: true,
    //       files: {'file': File(imagePath)},
    //     );
    //     if (response != null) {
    //       final imageData = response['data'];
    //       userJsonData["profile_pic"] = imageData["id"];
    //     }
    //   }
    //   var response = await _remoteService.patchResponse(
    //     endPoint: ApiRoutes.userEndPoint,
    //     isTokenRequired: true,
    //     payloadObj: userJsonData,
    //   );

    //   if (response != null) {
    //     final userResponseData = response['data'];
    //     UserEntity user = UserMapper.fromJsonToEntity(userResponseData);
    //     await _userSessionRepository.saveLoggedInUser(user);
    //   } else {
    //     throw ServerException(Messages.editUserDataFailed);
    //   }
    // } catch (error) {
    //   rethrow;
    // }
  }
}
