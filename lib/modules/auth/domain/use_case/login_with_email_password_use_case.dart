import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginWithEmailAndPasswordUseCase
    extends UseCase<void, LoginWithEmailAndPasswordUseCaseParams> {
  LoginWithEmailAndPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(LoginWithEmailAndPasswordUseCaseParams params) {
    return _authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginWithEmailAndPasswordUseCaseParams extends Equatable {
  const LoginWithEmailAndPasswordUseCaseParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
