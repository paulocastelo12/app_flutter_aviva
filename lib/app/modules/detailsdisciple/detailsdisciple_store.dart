import 'package:mobx/mobx.dart';

part 'detailsdisciple_store.g.dart';

class DetailsdiscipleStore = _DetailsdiscipleStoreBase with _$DetailsdiscipleStore;
abstract class _DetailsdiscipleStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}