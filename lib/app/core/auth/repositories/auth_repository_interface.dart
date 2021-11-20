import 'package:avivaapp/app/core/models/user_model.dart';


abstract class IAuthRepository{
  Future<UserModel>login(String login, String password);
  Future<void> saveSharedPref(Map<String, dynamic> data);
  Future<void> removeSharedPref();
  Future<Map<String, dynamic>> getStringValuesSF();
}