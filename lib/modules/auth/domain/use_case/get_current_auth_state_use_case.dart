import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/user/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentAuthStateUseCase
    extends UseCase<Stream<UserEntity?>, NoParams> {
  GetCurrentAuthStateUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Stream<UserEntity?> execute(NoParams params) {
    return _authRepository.getCurrentAuthUserState();
  }
}
