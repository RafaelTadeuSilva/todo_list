abstract class ApiDB {
  Future<Map<String, dynamic>> fetchById(String table, String id);
  Future<List<Map<String, dynamic>>> fetch(
      String table, Map<String, dynamic> filter);
  Future<Map<String, dynamic>> insert(String table, Map<String, dynamic> data);
  Future<Map<String, dynamic>> update(
      String table, Map<String, dynamic> data, String id);
  Future<bool> delete(String table, String id);
}
