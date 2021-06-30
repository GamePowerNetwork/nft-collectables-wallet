// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApiStore on ApiStoreBase, Store {
  final _$stateAtom = Atom(name: 'ApiStoreBase.state');

  @override
  ApiStoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ApiStoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$errorMessageAtom = Atom(name: 'ApiStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$initAppAsyncAction = AsyncAction('ApiStoreBase.initApp');

  @override
  Future<void> initApp(Keyring keyring) {
    return _$initAppAsyncAction.run(() => super.initApp(keyring));
  }

  final _$ApiStoreBaseActionController = ActionController(name: 'ApiStoreBase');

  @override
  void setState(ApiStoreState _state) {
    final _$actionInfo = _$ApiStoreBaseActionController.startAction(
        name: 'ApiStoreBase.setState');
    try {
      return super.setState(_state);
    } finally {
      _$ApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApiError(String _error) {
    final _$actionInfo = _$ApiStoreBaseActionController.startAction(
        name: 'ApiStoreBase.setApiError');
    try {
      return super.setApiError(_error);
    } finally {
      _$ApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage}
    ''';
  }
}
