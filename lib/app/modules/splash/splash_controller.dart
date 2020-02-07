import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_list_mobx/app/shared/services/secure_storage_interface.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashBase with _$SplashController;

abstract class _SplashBase with Store {
  final ISecureStorage _secureStorage = Modular.get();
  _SplashBase() {
    getUid();
  }

  @observable
  String uid = "";

  @action
  getUid() async {
    uid = await _secureStorage.getUid();
  }
}
