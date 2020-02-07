// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$uidAtom = Atom(name: '_LoginBase.uid');

  @override
  String get uid {
    _$uidAtom.context.enforceReadPolicy(_$uidAtom);
    _$uidAtom.reportObserved();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.context.conditionallyRunInAction(() {
      super.uid = value;
      _$uidAtom.reportChanged();
    }, _$uidAtom, name: '${_$uidAtom.name}_set');
  }

  final _$obscureTextAtom = Atom(name: '_LoginBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.context.enforceReadPolicy(_$obscureTextAtom);
    _$obscureTextAtom.reportObserved();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.context.conditionallyRunInAction(() {
      super.obscureText = value;
      _$obscureTextAtom.reportChanged();
    }, _$obscureTextAtom, name: '${_$obscureTextAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic setObscureText() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setObscureText();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }
}
