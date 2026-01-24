import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

@injectable
class DeleteAccountUseCase extends UseCase<void, DeleteAccountUseCaseParams> {
  DeleteAccountUseCase(this._deleteAccountRepository);

  final DeleteAccountRepository _deleteAccountRepository;

  @override
  Future<void> execute(DeleteAccountUseCaseParams params) {
    return _deleteAccountRepository.deleteUser(deleteType: params.deleteType);
  }
}

class DeleteAccountUseCaseParams extends Equatable {
  const DeleteAccountUseCaseParams({required this.deleteType});

  final DeleteType deleteType;

  @override
  List<Object?> get props => [deleteType];
}
