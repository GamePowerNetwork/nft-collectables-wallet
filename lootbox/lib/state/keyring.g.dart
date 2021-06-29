// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyring.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Keyring on KeyringBase, Store {
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

  final _$KeyringBaseActionController = ActionController(name: 'KeyringBase');

  @override
  void setPhrase(dynamic _phrase) {
    final _$actionInfo = _$KeyringBaseActionController.startAction(
        name: 'KeyringBase.setPhrase');
    try {
      return super.setPhrase(_phrase);
    } finally {
      _$KeyringBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phrase: ${phrase}
    ''';
  }
}
