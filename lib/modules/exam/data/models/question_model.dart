import 'dart:convert';

class QuestionModel {
  final String? id;
  final String? orderId;
  final String? text;
  final String? type;
  final List<OptionModel>? options;
  final bool? isMandatory;
  final String? errorText;

  const QuestionModel({
    this.id,
    this.orderId,
    this.text,
    this.type,
    this.options,
    this.isMandatory,
    this.errorText,
  });

  factory QuestionModel.fromRawJson(String str) =>
      QuestionModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json['id']?.toString(),
    orderId: json['order_id']?.toString(),
    text: json['text']?.toString(),
    type: json['type']?.toString(),
    isMandatory: json['is_mandatory'] as bool?,
    errorText: json['error_text']?.toString(),
    options: json['options'] == null
        ? const []
        : List<OptionModel>.from(
            (json['options'] as List<dynamic>).map(
              (x) => OptionModel.fromJson(x as Map<String, dynamic>),
            ),
          ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_id': orderId,
    'text': text,
    'type': type,
    'is_mandatory': isMandatory,
    'error_text': errorText,
    'options': options == null
        ? []
        : List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class OptionModel {
  final String? id;
  final String? text;
  final String? imageUrl;

  const OptionModel({this.id, this.text, this.imageUrl});

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
    id: json['id']?.toString(),
    text: json['text']?.toString(),
    imageUrl: json['image_url']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'image_url': imageUrl,
  };
}
