import 'package:todo_list/shared/database/database.dart';

class SqfliteDatabase implements Database {
  @override
  Future<bool> delete(String table, String id) {}

  @override
  Future<List<Map<String, dynamic>>> fetch(String table) {
    return Future.value([]);
  }

  @override
  Future<Map<String, dynamic>> insert(
      String table, Map<String, dynamic> data) {}

  @override
  Future<Map<String, dynamic>> update(
      String table, Map<String, dynamic> data, String id) {}
}
