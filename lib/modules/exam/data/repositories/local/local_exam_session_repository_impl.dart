import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

@Injectable(as: LocalExamSessionRepository)
class LocalExamSessionRepositoryImpl implements LocalExamSessionRepository {
  Box get _box => Hive.pendingExamsDataBox;

  String _sessionKey(String examId) => HiveTableKeys.getKey(
    boxName: HiveBoxNameKeys.pendingExamsDataBoxName,
    keyName: '${HiveTableKeys.pendingExamsKey}_$examId',
  );

  String get _indexKey => HiveTableKeys.getKey(
    boxName: HiveBoxNameKeys.pendingExamsDataBoxName,
    keyName: HiveTableKeys.pendingExamsIndexKey,
  );

  @override
  Future<void> saveSession(ExamSessionEntity session) async {
    final ids = (_box.get(_indexKey, defaultValue: <String>[]) as List)
        .map((e) => e.toString())
        .toSet();

    ids.add(session.examId);

    final model = ExamSessionMapper.toModel(session);

    await _box.put(_sessionKey(session.examId), jsonEncode(model.toJson()));
    await _box.put(_indexKey, ids.toList());
  }

  @override
  Future<ExamSessionEntity?> getSession(String examId) async {
    final raw = _box.get(_sessionKey(examId));

    if (raw == null) return null;

    try {
      if (raw is String) {
        final json = jsonDecode(raw) as Map<String, dynamic>;
        return ExamSessionMapper.toEntity(ExamSessionModel.fromJson(json));
      }

      if (raw is Map) {
        return ExamSessionMapper.toEntity(
          ExamSessionModel.fromJson(Map<String, dynamic>.from(raw)),
        );
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<ExamSessionEntity>> getPendingSessions() async {
    final ids = (_box.get(_indexKey, defaultValue: <String>[]) as List)
        .map((e) => e.toString())
        .toList();

    final sessions = <ExamSessionEntity>[];

    for (final id in ids) {
      final session = await getSession(id);
      if (session != null && !session.isSubmitted) {
        sessions.add(session);
      }
    }

    sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return sessions;
  }

  @override
  Future<void> deleteSession(String examId) async {
    final ids = (_box.get(_indexKey, defaultValue: <String>[]) as List)
        .map((e) => e.toString())
        .toSet();

    ids.remove(examId);

    await _box.delete(_sessionKey(examId));
    await _box.put(_indexKey, ids.toList());
  }

  @override
  Future<void> clearAllSessions() async {
    final ids = (_box.get(_indexKey, defaultValue: <String>[]) as List)
        .map((e) => e.toString())
        .toList();

    for (final id in ids) {
      await _box.delete(_sessionKey(id));
    }

    await _box.put(_indexKey, <String>[]);
  }

  @override
  Stream<List<ExamSessionEntity>> watchPendingSessions() async* {
    yield await getPendingSessions();

    yield* Hive.pendingExamsDataBox.watch().asyncMap((_) async {
      return getPendingSessions();
    });
  }
}
