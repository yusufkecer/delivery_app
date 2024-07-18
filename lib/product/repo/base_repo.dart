abstract class BaseRepo<M, T> {
  Future get();
  Future<void> create(M body);
  Future<void> update(T body, String id);
  Future<void> delete();
}
