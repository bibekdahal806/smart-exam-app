import 'dart:convert';

class QuestionModel {
  final String? id;
  final String? text;
  final String? type;
  List<OptionModel>? options;

  QuestionModel({this.id, this.text, this.type, this.options});

  QuestionModel copyWith({
    String? id,
    String? text,
    String? type,
    List<OptionModel>? options,
  }) => QuestionModel(
    id: id ?? this.id,
    text: text ?? this.text,
    type: type ?? this.type,
    options: options ?? this.options,
  );

  factory QuestionModel.fromRawJson(String str) =>
      QuestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json["id"],
    text: json["text"],
    type: json["type"],
    options: json["options"] == null
        ? []
        : List<OptionModel>.from(
            json["options"]!.map((x) => OptionModel.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "type": type,
    "options": options == null
        ? []
        : List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class OptionModel {
  final String? id;
  final String? text;
  final String? imageUrl;

  OptionModel({this.id, this.text, this.imageUrl});

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
    id: json["id"],
    text: json["text"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "image_url": imageUrl,
  };
}
