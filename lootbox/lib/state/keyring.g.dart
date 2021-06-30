// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyring.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Keyring on KeyringBase, Store {
  final _$channelAtom = Atom(name: 'KeyringBase.channel');

  @override
  KeyringChannel get channel {
    _$channelAtom.reportRead();
    return super.channel;
  }

  @override
  set channel(KeyringChannel value) {
    _$channelAtom.reportWrite(value, super.channel, () {
      super.channel = value;
    });
  }

  final _$KeyringBaseActionController = ActionController(name: 'KeyringBase');

  @override
  dynamic onChannelData(dynamic data) {
    final _$actionInfo = _$KeyringBaseActionController.startAction(
        name: 'KeyringBase.onChannelData');
    try {
      return super.onChannelData(data);
    } finally {
      _$KeyringBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic init(WebViewService webViewService) {
    final _$actionInfo =
        _$KeyringBaseActionController.startAction(name: 'KeyringBase.init');
    try {
      return super.init(webViewService);
    } finally {
      _$KeyringBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
channel: ${channel}
    ''';
  }
}
