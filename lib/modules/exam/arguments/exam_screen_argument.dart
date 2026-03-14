import 'package:equatable/equatable.dart';

class ExamScreenArgument extends Equatable {
  final String? subjectId;
  final String? subjectName;
  final bool loadAll;

  const ExamScreenArgument({
    this.subjectId,
    this.subjectName,
    this.loadAll = false,
  });

  const ExamScreenArgument.all()
    : subjectId = null,
      subjectName = null,
      loadAll = true;

  const ExamScreenArgument.bySubject({
    required this.subjectId,
    this.subjectName,
  }) : loadAll = false;

  bool get isBySubject => !loadAll && (subjectId ?? '').trim().isNotEmpty;

  @override
  List<Object?> get props => [subjectId, subjectName, loadAll];
}
