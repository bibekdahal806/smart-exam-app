import 'package:q_bank/core/core.dart';

abstract class DeleteAccountRepository {
  Future<void> deleteUser({required DeleteType deleteType});
}
