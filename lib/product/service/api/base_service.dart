abstract class BaseService {
  Future<void> get(String endPoint);
  Future<void> create(String endPoint, Map<String, dynamic> body);
  Future<void> update(String endPoint, Map<String, dynamic> body, String id);
  Future<void> delete(String endPoint);
}
