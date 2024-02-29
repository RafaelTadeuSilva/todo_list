import 'package:sqflite/sqflite.dart';
import 'package:todo_list/shared/database/database.dart';
import 'package:uuid/uuid.dart';

class SqfliteDatabase implements ApiDB {
  late final Database _database;

  SqfliteDatabase._(this._database);

  SqfliteDatabase(this._database) {
    instance = SqfliteDatabase._(_database);
  }

  static late final ApiDB? instance;

  @override
  Future<bool> delete(String table, String id) async {
    final count =
        await _database.delete(table, where: 'id = ?', whereArgs: [id]);
    return count > 0;
  }

  @override
  Future<Map<String, dynamic>> fetchById(String table, String id) async {
    try {
      final list =
          await _database.query(table, where: 'id = ?', whereArgs: [id]);
      return list.first;
    } catch (e) {
      return {};
    }
  }

  @override
  Future<Map<String, dynamic>> insert(
      String table, Map<String, dynamic> data) async {
    data['id'] = const Uuid().v1();
    await _database.insert(table, data);
    return data;
  }

  @override
  Future<Map<String, dynamic>> update(
      String table, Map<String, dynamic> data, String id) async {
    await _database.update(table, data, where: 'id = ?', whereArgs: [id]);
    return data;
  }

  @override
  Future<List<Map<String, dynamic>>> fetch(
      String table, Map<String, dynamic> filter) async {
    return await _database.query(table);
  }
}
