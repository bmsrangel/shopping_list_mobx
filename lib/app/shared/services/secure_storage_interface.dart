abstract class ISecureStorage {
  Future<void> storeUid(String uid);
  Future<String> getUid();
  Future<void> clearUid();
}
