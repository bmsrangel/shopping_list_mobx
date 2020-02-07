import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_mobx/app/shared/repositories/repositories_interface.dart';
import 'package:shopping_list_mobx/app/shared/services/secure_storage_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final IRepository _repo = Modular.get();
  final ISecureStorage _secureStorage = Modular.get();

  final email$ = TextEditingController();
  final password$ = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @observable
  String uid = '';

  @observable
  bool obscureText = true;

  @action
  setObscureText() => obscureText = !obscureText;

  @action
  login() async {
    List<int> bytes = utf8.encode(password$.text); // data being hashed
    Digest digest = md5.convert(bytes);

    print("Digest as hex string: $digest");
    try {
      uid = await _repo.login(email$.text, digest.toString());
      if (uid != null) {
        print(uid);
        _secureStorage.storeUid(uid);
      }
    } catch (e) {
      throw e;
    }
  }
}
