// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhraseState on PhraseStateBase, Store {
  final _$hasErrorAtom = Atom(name: 'PhraseStateBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$isVerifiedAtom = Atom(name: 'PhraseStateBase.isVerified');

  @override
  bool get isVerified {
    _$isVerifiedAtom.reportRead();
    return super.isVerified;
  }

  @override
  set isVerified(bool value) {
    _$isVerifiedAtom.reportWrite(value, super.isVerified, () {
      super.isVerified = value;
    });
  }

  final _$verifiedPhrasesAtom = Atom(name: 'PhraseStateBase.verifiedPhrases');

  @override
  ObservableList<Map<String, dynamic>> get verifiedPhrases {
    _$verifiedPhrasesAtom.reportRead();
    return super.verifiedPhrases;
  }

  @override
  set verifiedPhrases(ObservableList<Map<String, dynamic>> value) {
    _$verifiedPhrasesAtom.reportWrite(value, super.verifiedPhrases, () {
      super.verifiedPhrases = value;
    });
  }

  final _$PhraseStateBaseActionController =
      ActionController(name: 'PhraseStateBase');

  @override
  void addWord(String word) {
    final _$actionInfo = _$PhraseStateBaseActionController.startAction(
        name: 'PhraseStateBase.addWord');
    try {
      return super.addWord(word);
    } finally {
      _$PhraseStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPhrase() {
    final _$actionInfo = _$PhraseStateBaseActionController.startAction(
        name: 'PhraseStateBase.resetPhrase');
    try {
      return super.resetPhrase();
    } finally {
      _$PhraseStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasError: ${hasError},
isVerified: ${isVerified},
verifiedPhrases: ${verifiedPhrases}
    ''';
  }
}
