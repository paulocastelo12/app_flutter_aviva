// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerdisciple_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterdiscipleStore on _RegisterdiscipleStoreBase, Store {
  final _$loadingAtom = Atom(name: '_RegisterdiscipleStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$sexoAtom = Atom(name: '_RegisterdiscipleStoreBase.sexo');

  @override
  String get sexo {
    _$sexoAtom.reportRead();
    return super.sexo;
  }

  @override
  set sexo(String value) {
    _$sexoAtom.reportWrite(value, super.sexo, () {
      super.sexo = value;
    });
  }

  final _$fxEtariaAtom = Atom(name: '_RegisterdiscipleStoreBase.fxEtaria');

  @override
  String get fxEtaria {
    _$fxEtariaAtom.reportRead();
    return super.fxEtaria;
  }

  @override
  set fxEtaria(String value) {
    _$fxEtariaAtom.reportWrite(value, super.fxEtaria, () {
      super.fxEtaria = value;
    });
  }

  final _$bairroAtom = Atom(name: '_RegisterdiscipleStoreBase.bairro');

  @override
  String get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(String value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$sendNewDiscipleAsyncAction =
      AsyncAction('_RegisterdiscipleStoreBase.sendNewDisciple');

  @override
  Future<String> sendNewDisciple() {
    return _$sendNewDiscipleAsyncAction.run(() => super.sendNewDisciple());
  }

  final _$_RegisterdiscipleStoreBaseActionController =
      ActionController(name: '_RegisterdiscipleStoreBase');

  @override
  dynamic setSexo(String value) {
    final _$actionInfo = _$_RegisterdiscipleStoreBaseActionController
        .startAction(name: '_RegisterdiscipleStoreBase.setSexo');
    try {
      return super.setSexo(value);
    } finally {
      _$_RegisterdiscipleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFxEtaria(String value) {
    final _$actionInfo = _$_RegisterdiscipleStoreBaseActionController
        .startAction(name: '_RegisterdiscipleStoreBase.setFxEtaria');
    try {
      return super.setFxEtaria(value);
    } finally {
      _$_RegisterdiscipleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBairro(String value) {
    final _$actionInfo = _$_RegisterdiscipleStoreBaseActionController
        .startAction(name: '_RegisterdiscipleStoreBase.setBairro');
    try {
      return super.setBairro(value);
    } finally {
      _$_RegisterdiscipleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_RegisterdiscipleStoreBaseActionController
        .startAction(name: '_RegisterdiscipleStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_RegisterdiscipleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
sexo: ${sexo},
fxEtaria: ${fxEtaria},
bairro: ${bairro}
    ''';
  }
}
