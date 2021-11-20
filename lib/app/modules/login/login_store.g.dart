// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAtom = Atom(name: '_LoginStoreBase.login');

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$controllerLoginAtom = Atom(name: '_LoginStoreBase.controllerLogin');

  @override
  TextEditingController get controllerLogin {
    _$controllerLoginAtom.reportRead();
    return super.controllerLogin;
  }

  @override
  set controllerLogin(TextEditingController value) {
    _$controllerLoginAtom.reportWrite(value, super.controllerLogin, () {
      super.controllerLogin = value;
    });
  }

  final _$controllerPasswordAtom =
      Atom(name: '_LoginStoreBase.controllerPassword');

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  final _$loginAuthAsyncAction = AsyncAction('_LoginStoreBase.loginAuth');

  @override
  Future<dynamic> loginAuth() {
    return _$loginAuthAsyncAction.run(() => super.loginAuth());
  }

  final _$getSharedPrefAsyncAction =
      AsyncAction('_LoginStoreBase.getSharedPref');

  @override
  Future getSharedPref() {
    return _$getSharedPrefAsyncAction.run(() => super.getSharedPref());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic setLogin(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
login: ${login},
password: ${password},
controllerLogin: ${controllerLogin},
controllerPassword: ${controllerPassword}
    ''';
  }
}
