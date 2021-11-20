import 'package:avivaapp/app/core/auth/auth_store_store.dart';
import 'package:avivaapp/app/core/models/disciple_model.dart';
import 'package:avivaapp/app/modules/home/repositories/home_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  HomeStoreBase(){
    getDisciple();
  }

  final IHomeRepository _homeRepository = Modular.get();
  final AuthStoreStore _authStoreStore = Modular.get();

  @observable
  bool loading = false;

  @observable
  ObservableList<DiscipleModel> listdisciple;

  @action
  Future getDisciple() async {
    loading = true;

    listdisciple = null;

    var list = await _homeRepository.getDisciple(_authStoreStore.user.sId);
    listdisciple = list.asObservable();
    
    loading = false;
  }
}