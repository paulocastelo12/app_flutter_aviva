
import 'package:avivaapp/app/core/models/disciple_model.dart';
import 'package:avivaapp/app/modules/home/repositories/home_repository_interface.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:dio/dio.dart';


class HomeRepository implements IHomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  @override
  Future<List<DiscipleModel>> getDisciple(String id) async {

    try {
      var response = await _dio.get(
          '/users/$id/disciples');

      return (response.data as List).map((e) => DiscipleModel.fromJson(e)).toList();

    } on DioError catch (e) {
      GlobalSnackBar.instance.showSnackBarError("Ops! ${e.message}");
    }

    return null;

  }

 


}
