abstract class Database {
  Future<List<Map<String, dynamic>>> fetch(String table);
  Future<Map<String, dynamic>> insert(String table, Map<String, dynamic> data);
  Future<Map<String, dynamic>> update(
      String table, Map<String, dynamic> data, String id);
  Future<bool> delete(String table, String id);
}
