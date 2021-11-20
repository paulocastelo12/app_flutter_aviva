import 'package:avivaapp/app/core/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repositories/auth_repository_interface.dart';

part 'auth_store_store.g.dart';

class AuthStoreStore = _AuthStoreStoreBase with _$AuthStoreStore;

abstract class _AuthStoreStoreBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  UserModel user;

  @action
  Future<UserModel> loginAuth(String login, String password) async {
    user = await _authRepository.login(login, password);

    Map<String, dynamic> data = {"login": login, "password": password};

    if (user != null) {
      _authRepository.saveSharedPref(data);
    }

    return user;
  }

  Future<Map<String, dynamic>> getSharedPref() async {
    Map<String, dynamic> map = await _authRepository.getStringValuesSF();
    return map;
  }

  logout() {
    user = null;
    Modular.to.navigate("/login/");
  }
}
