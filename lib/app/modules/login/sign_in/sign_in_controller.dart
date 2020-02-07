import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_list_mobx/app/shared/models/user_model.dart';
import 'package:shopping_list_mobx/app/shared/repositories/repositories_interface.dart';
import 'package:shopping_list_mobx/app/shared/services/secure_storage_interface.dart';

part 'sign_in_controller.g.dart';

class SignInController = _SignInBase with _$SignInController;

abstract class _SignInBase with Store {
  final TextEditingController nome$ = TextEditingController();
  final TextEditingController sobrenome$ = TextEditingController();
  final TextEditingController email$ = TextEditingController();
  final TextEditingController senha$ = TextEditingController();

  final IRepository _repo = Modular.get();
  final ISecureStorage _secureStorage = Modular.get();

  @observable
  String uid;

  @action
  cadastrar() async {
    List<int> bytes = utf8.encode(senha$.text); // data being hashed
    Digest digest = md5.convert(bytes);

    print("Digest as hex string: $digest");
    UserModel user = UserModel(
      nome: nome$.text,
      sobrenome: sobrenome$.text,
      email: email$.text,
      senha: digest.toString(),
    );
    uid = await _repo.createUser(user);
    print(uid);
    if (uid != null) {
      await _secureStorage.storeUid(uid);
    }
  }
}
