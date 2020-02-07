import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_list_mobx/app/shared/services/secure_storage_interface.dart';

class SecureStorageService extends Disposable implements ISecureStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Future<void> clearUid() async {
    await _secureStorage.delete(key: 'uid');
  }

  @override
  Future<String> getUid() async {
    String uid = await _secureStorage.read(key: 'uid');
    return uid;
  }

  @override
  Future<void> storeUid(String uid) async {
    await _secureStorage.write(key: 'uid', value: uid);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
