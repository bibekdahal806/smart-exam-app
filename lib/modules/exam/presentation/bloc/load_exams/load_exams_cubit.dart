import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'load_exams_state.dart';

class LoadExamsCubit extends Cubit<LoadExamsState> {
  final RemoteExamRepository _remoteExamRepository =
      getIt<RemoteExamRepository>();
  LoadExamsCubit() : super(LoadExamsState());

  Future<void> loadExams() async {
    emit(state.copyWith(loadingState: AppLoadingState.loading));
    try {
      var result = await _remoteExamRepository.getExams();
      emit(
        state.copyWith(loadingState: AppLoadingState.success, exams: result),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AppLoadingState.failure,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> reLoadExams() async {
    return loadExams();
  }
}
