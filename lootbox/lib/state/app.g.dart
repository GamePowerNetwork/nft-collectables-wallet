// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppStateBase, Store {
  Computed<AppCurrentState>? _$stateComputed;

  @override
  AppCurrentState get state =>
      (_$stateComputed ??= Computed<AppCurrentState>(() => super.state,
              name: '_AppStateBase.state'))
          .value;

  final _$channelAtom = Atom(name: '_AppStateBase.channel');

  @override
  AppChannel get channel {
    _$channelAtom.reportRead();
    return super.channel;
  }

  @override
  set channel(AppChannel value) {
    _$channelAtom.reportWrite(value, super.channel, () {
      super.channel = value;
    });
  }

  final _$initAppAsyncAction = AsyncAction('_AppStateBase.initApp');

  @override
  Future<void> initApp(Keyring keyring) {
    return _$initAppAsyncAction.run(() => super.initApp(keyring));
  }

  final _$_AppStateBaseActionController =
      ActionController(name: '_AppStateBase');

  @override
  dynamic onChannelData(dynamic data) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction(
        name: '_AppStateBase.onChannelData');
    try {
      return super.onChannelData(data);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
channel: ${channel},
state: ${state}
    ''';
  }
}
