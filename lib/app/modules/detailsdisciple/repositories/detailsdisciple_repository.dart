
import 'package:avivaapp/app/modules/detailsdisciple/repositories/detailsdisciple_repository_interface.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:dio/dio.dart';


class DetailsdiscipleRepository implements IDetailsdiscipleRepository {
  final Dio _dio;

  DetailsdiscipleRepository(this._dio);

  @override
  Future<String> deleteDisciple(String idUser, idDisciple) async {
  try {
      var response = await _dio.delete(
        "/users/$idUser/disciple/$idDisciple",
      );
      
      print(response.data.toString());

      return response.data['message'];
    } on DioError catch (e) {
      
      GlobalSnackBar.instance.showSnackBarError("Ops! Try again later"+e.message);
      
    }

    return null;
  }


 


}
