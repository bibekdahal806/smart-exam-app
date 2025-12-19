import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/user/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedInUserUseCase extends UseCase<UserEntity?, NoParams> {
  GetLoggedInUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<UserEntity?> execute(NoParams params) {
    return _authRepository.getLoggedInUser();
  }
}
