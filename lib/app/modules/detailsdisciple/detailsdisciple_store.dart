import 'package:avivaapp/app/core/auth/auth_store_store.dart';
import 'package:avivaapp/app/modules/detailsdisciple/repositories/detailsdisciple_repository_interface.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'detailsdisciple_store.g.dart';

class DetailsdiscipleStore = _DetailsdiscipleStoreBase
    with _$DetailsdiscipleStore;

abstract class _DetailsdiscipleStoreBase with Store {
  final IDetailsdiscipleRepository _detailsdiscipleRepository = Modular.get();
  final AuthStoreStore _authStoreStore = Modular.get();

  @observable
  bool loading = false;

  @action
  Future<String> delete(String idDisciple) async {
    loading = true;
    String result = await _detailsdiscipleRepository.deleteDisciple(
        _authStoreStore.user.sId, idDisciple);

    loading = false;

    if (result == "Ok") {
      GlobalSnackBar.instance.showSnackBarSuccess("Deletado c/ sucesso!");
      return result;
    }

    return null;
  }

  String formatDateHr(String dateHr) {
    var arrDateHr = dateHr.split("T");

    String date = arrDateHr[0];
    String hr = arrDateHr[1];

    var arrDate = date.split("-");

    String year = arrDate[0];
    String month = arrDate[1];
    String day = arrDate[2];

    return day + "/" + month + "/" + year + " " + hr.substring(0, 8);
  }
}
