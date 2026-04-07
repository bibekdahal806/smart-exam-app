import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String? id;
  final String? name;
  final int? examCount;
  final int? attemptedExamCount;

  const SubjectEntity({
    this.id,
    this.name,
    this.examCount,
    this.attemptedExamCount,
  });

  SubjectEntity copyWith({
    String? id,
    String? name,
    int? examCount,
    int? attemptedExamCount,
  }) {
    return SubjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      examCount: examCount ?? this.examCount,
      attemptedExamCount: attemptedExamCount ?? this.attemptedExamCount,
    );
  }

  @override
  List<Object?> get props => [id, name, examCount, attemptedExamCount];
}
