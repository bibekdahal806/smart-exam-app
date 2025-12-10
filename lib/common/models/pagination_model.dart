import 'dart:convert';

PaginationModel paginationModelFromRawJson(String str) =>
    PaginationModel.fromJson(json.decode(str));

class PaginationModel {
  int count;
  String next;
  String previous;
  List<dynamic> results;

  PaginationModel({
    this.count = 0,
    this.next = "",
    this.previous = "",
    this.results = const [],
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] != null
            ? List<dynamic>.from(json["results"])
            : [], // Ensure results is a List<dynamic>
      );
  int? nextOffset() {
    if (next.isNotEmpty) {
      final Uri uri = Uri.parse(next);
      return int.tryParse(uri.queryParameters['offset'] ?? '');
    }
    return null;
  }

  int? previousOffset() {
    if (previous.isNotEmpty) {
      final Uri uri = Uri.parse(previous);
      return int.tryParse(uri.queryParameters['offset'] ?? '');
    }
    return null;
  }
}
