import 'package:avivaapp/app/core/auth/repositories/auth_repository_interface.dart';
import 'package:avivaapp/app/core/models/user_model.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepository implements IAuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  @override
  Future<UserModel> login(String login, String password) async {
    try {
      var response = await _dio.post(
        "/users/login",
        data: {"login": login, "password": password},
      );

      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 403) {
        GlobalSnackBar.instance
            .showSnackBarError("Invalid password or username");
      }
      if (e.response.statusCode == 500) {
        GlobalSnackBar.instance.showSnackBarError("Ops! Try again later");
      }
    }

    return null;
  }

   @override
  Future<Map<String, dynamic>> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String loginValueSF = "";
    prefs.getString('login') == null
        ? loginValueSF = ""
        : loginValueSF = prefs.getString('login');

    String passwordValueSF = "";
    prefs.getString('password') == null
        ? passwordValueSF = ""
        : passwordValueSF = prefs.getString('password');

    Map<String, dynamic> dataSF = {
      "login": loginValueSF,
      "password": passwordValueSF
    };

    return dataSF;
  }

  @override
  Future<void> removeSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<void> saveSharedPref(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', data['login']);
    prefs.setString('password', data['password']);
  }


}
