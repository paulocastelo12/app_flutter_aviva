
import 'package:avivaapp/app/modules/registerdisciple/repositories/registerdisciple_repository_interface.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:dio/dio.dart';


class RegisterdiscipleRepository implements IRegisterdiscipleRepository {
  final Dio _dio;

  RegisterdiscipleRepository(this._dio);

  @override
  Future<String> createNewDisciple(String idUser,Map<String, dynamic> map) async {
  try {
      var response = await _dio.put(
        "/users/$idUser/disciple",
        data: map,
      );
      
      print(response.data.toString());

      return response.data['message'];
    } on DioError catch (e) {
      
      GlobalSnackBar.instance.showSnackBarError("Ops! Try again later"+e.message);
      
    }

    return null;
  }


 


}
