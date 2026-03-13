import 'package:equatable/equatable.dart';
import 'package:q_bank/modules/exam/exam.dart';

/// String id
/// String text
/// [QuestionType] type (single/multi/text)
/// [List<OptionEntity>] options (for single/multi)
class QuestionEntity extends Equatable {
  final String? id;
  final String? orderId;
  final String? text;
  final QuestionType type;
  final List<OptionEntity> options;

  const QuestionEntity({
    this.id,
    this.orderId,
    this.text,
    this.type = QuestionType.text,
    this.options = const [],
  });

  @override
  List<Object?> get props => [id, orderId, text, type, options];
}

class OptionEntity extends Equatable {
  final String? id;
  final String? text;
  final String? imageUrl;

  const OptionEntity({this.id, this.text, this.imageUrl});

  @override
  List<Object?> get props => [id, text, imageUrl];
}
