import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String? id;
  final String? name;
  final int? examCount;

  const SubjectEntity({this.id, this.name, this.examCount});

  SubjectEntity copyWith({String? id, String? name, int? examCount}) {
    return SubjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      examCount: examCount ?? this.examCount,
    );
  }

  @override
  List<Object?> get props => [id, name, examCount];
}
