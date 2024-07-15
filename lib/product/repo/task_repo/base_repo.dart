abstract class BaseRepo {
  Future get();
  Future<void> create(Map<String, dynamic> body);
  Future<void> update(Map<String, dynamic> body);
  Future<void> delete();
}
