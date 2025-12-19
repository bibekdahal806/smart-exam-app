import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase extends UseCase<Future<void>, NoParams> {
  LogoutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(NoParams params) {
    return _authRepository.logout(isStillAuthenticated: true);
  }
}
