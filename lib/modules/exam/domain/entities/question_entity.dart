import 'package:equatable/equatable.dart';
import 'package:q_bank/modules/exam/exam.dart';

class QuestionEntity extends Equatable {
  final String? id;
  final String? orderId;
  final String? text;
  final QuestionType type;
  final List<OptionEntity> options;
  final bool isMandatory;
  final String? errorText;

  const QuestionEntity({
    this.id,
    this.orderId,
    this.text,
    this.type = QuestionType.text,
    this.options = const [],
    this.isMandatory = false,
    this.errorText,
  });

  @override
  List<Object?> get props => [
    id,
    orderId,
    text,
    type,
    options,
    isMandatory,
    errorText,
  ];
}

class OptionEntity extends Equatable {
  final String? id;
  final String? text;
  final String? imageUrl;

  const OptionEntity({this.id, this.text, this.imageUrl});

  @override
  List<Object?> get props => [id, text, imageUrl];
}
