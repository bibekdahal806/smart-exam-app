import 'dart:async';

import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:q_bank/modules/user/user.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditUserDataUsecase extends UseCase<void, EditUserDataUsecaseParams> {
  final EditProfileRepository _editProfileRepository;
  EditUserDataUsecase(this._editProfileRepository);

  @override
  FutureOr<void> execute(EditUserDataUsecaseParams params) {
    return _editProfileRepository.editUserData(
      entity: params.userEntity,
      imagePath: params.imagePath,
    );
  }
}

class EditUserDataUsecaseParams extends Equatable {
  final UserEntity userEntity;
  final String? imagePath;
  const EditUserDataUsecaseParams({required this.userEntity, this.imagePath});

  @override
  List<Object?> get props => [userEntity, imagePath];
}
