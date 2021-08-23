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

  final _$phraseAtom = Atom(name: 'KeyringBase.phrase');

  @override
  String get phrase {
    _$phraseAtom.reportRead();
    return super.phrase;
  }

  @override
  set phrase(String value) {
    _$phraseAtom.reportWrite(value, super.phrase, () {
      super.phrase = value;
    });
  }

  final _$requestPhraseAsyncAction = AsyncAction('KeyringBase.requestPhrase');

  @override
  Future<void> requestPhrase() {
    return _$requestPhraseAsyncAction.run(() => super.requestPhrase());
  }

  @override
  String toString() {
    return '''
channel: ${channel},
phrase: ${phrase}
    ''';
  }
}
