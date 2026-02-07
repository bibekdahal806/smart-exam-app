import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteAccountRepository)
class DeleteAccountRepositoryImpl implements DeleteAccountRepository {
  DeleteAccountRepositoryImpl();

  final CustomLogger _log = CustomLogger(title: "Auth Rep Impl");

  @override
  Future<void> deleteUser({required DeleteType deleteType}) async {
    _log.i(
      "it is delete type ${deleteType.isDelete ? "delete" : "deactivate"}",
    );
    await Future.delayed(const Duration(seconds: 2));
  }
}
