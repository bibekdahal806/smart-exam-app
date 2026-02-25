import 'package:equatable/equatable.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class QuestionEntity extends Equatable {
  final String? id;
  final String? text;
  final QuestionType type;
  final List<OptionEntity> options;

  const QuestionEntity({
    this.id,
    this.text,
    this.type = QuestionType.text,
    this.options = const [],
  });

  @override
  List<Object?> get props => [id, text, type, options];
}

class OptionEntity extends Equatable {
  final String? id;
  final String? text;
  final String? imageUrl;

  const OptionEntity({this.id, this.text, this.imageUrl});

  @override
  List<Object?> get props => [id, text, imageUrl];
}
