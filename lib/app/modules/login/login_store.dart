import 'package:avivaapp/app/core/auth/auth_store_store.dart';
import 'package:avivaapp/app/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {

  _LoginStoreBase(){
     getSharedPref();
  }
  final AuthStoreStore authStore = Modular.get();

  @observable
  bool loading = false;

  @observable
  String login = "";

  @action
  setLogin(String value) => login = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  @observable
  TextEditingController controllerLogin = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  Future loginAuth() async {
    loading = true;

    UserModel user = await authStore.loginAuth(login, password);

    loading = false;

    if (user != null) {
      Modular.to.navigate("/home/");
    }

    return null;
  }

  @action
  getSharedPref() async {
    Map<String, dynamic> map = await authStore.getSharedPref();
    login = map['login'];
    controllerLogin.text = login;
    password = map['password'];
    controllerPassword.text = password;
  }
}
