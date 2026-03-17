import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/exam/exam.dart';

@Injectable(as: LocalBookmarkedExamRepository)
class LocalBookmarkedExamRepositoryImpl
    implements LocalBookmarkedExamRepository {
  Box<dynamic> get _box => Hive.bookmarkedExamsDataBox;

  String _examKey(String examId) => HiveTableKeys.getKey(
    boxName: HiveBoxNameKeys.bookmarkedExamsDataBoxName,
    keyName: '${HiveTableKeys.bookmarkedExamsKey}_$examId',
  );

  String get _indexKey => HiveTableKeys.getKey(
    boxName: HiveBoxNameKeys.bookmarkedExamsDataBoxName,
    keyName: HiveTableKeys.bookmarkedExamsIndexKey,
  );

  List<String> _readIds() {
    final raw = _box.get(_indexKey, defaultValue: <String>[]) as List;
    return raw.map((e) => e.toString()).toList();
  }

  Future<void> _writeIds(List<String> ids) async {
    await _box.put(_indexKey, ids.toSet().toList());
  }

  @override
  Future<void> bookmarkExam(ExamEntity exam) async {
    final examId = (exam.id ?? '').trim();
    if (examId.isEmpty) return;

    final ids = _readIds().toSet();
    ids.add(examId);

    final model = ExamMapper.toModel(exam);

    await _box.put(_examKey(examId), jsonEncode(model.toJson()));
    await _writeIds(ids.toList());
  }

  @override
  Future<void> removeBookmark(String examId) async {
    final id = examId.trim();
    if (id.isEmpty) return;

    final ids = _readIds().toSet();
    ids.remove(id);

    await _box.delete(_examKey(id));
    await _writeIds(ids.toList());
  }

  @override
  Future<void> toggleBookmark(ExamEntity exam) async {
    final examId = (exam.id ?? '').trim();
    if (examId.isEmpty) return;

    final exists = await isBookmarked(examId);
    if (exists) {
      await removeBookmark(examId);
    } else {
      await bookmarkExam(exam);
    }
  }

  @override
  Future<bool> isBookmarked(String examId) async {
    final id = examId.trim();
    if (id.isEmpty) return false;
    return _box.get(_examKey(id)) != null;
  }

  @override
  Future<List<ExamEntity>> getBookmarkedExams() async {
    final ids = _readIds();
    final exams = <ExamEntity>[];

    for (final id in ids) {
      final raw = _box.get(_examKey(id));
      if (raw == null) continue;

      try {
        final json = jsonDecode(raw as String) as Map<String, dynamic>;
        final exam = ExamMapper.toEntity(ExamModel.fromJson(json));
        exams.add(exam);
      } catch (_) {}
    }

    return exams;
  }

  @override
  Stream<List<ExamEntity>> watchBookmarkedExams() async* {
    yield await getBookmarkedExams();

    yield* _box.watch().asyncMap((_) async {
      return getBookmarkedExams();
    });
  }

  @override
  Stream<bool> watchIsBookmarked(String examId) async* {
    yield await isBookmarked(examId);

    yield* _box.watch().asyncMap((_) async {
      return isBookmarked(examId);
    });
  }
}
