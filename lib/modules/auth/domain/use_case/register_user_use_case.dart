import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/auth/auth.dart';

@injectable
class RegisterUserUseCase extends UseCase<void, RegisterUserUseCaseParams> {
  RegisterUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(RegisterUserUseCaseParams params) {
    return _authRepository.registerUser(
      email: params.email,
      fullName: params.fullName,
      phoneNumber: params.phoneNumber,
      address: params.address,
      password: params.password,
    );
  }
}

class RegisterUserUseCaseParams extends Equatable {
  const RegisterUserUseCaseParams({
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.password,
  });

  final String email;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String password;

  @override
  List<Object> get props => [email, fullName, phoneNumber, address, password];
}
