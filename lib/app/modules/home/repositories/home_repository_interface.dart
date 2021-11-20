

import 'package:avivaapp/app/core/models/disciple_model.dart';

abstract class IHomeRepository{
  Future<List<DiscipleModel>>getDisciple(String id);
}