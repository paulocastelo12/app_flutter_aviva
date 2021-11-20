// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStoreStore on _AuthStoreStoreBase, Store {
  final _$loginAuthAsyncAction = AsyncAction('_AuthStoreStoreBase.loginAuth');

  @override
  Future<UserModel> loginAuth(String login, String password) {
    return _$loginAuthAsyncAction.run(() => super.loginAuth(login, password));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
