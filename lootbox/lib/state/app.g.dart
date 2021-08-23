// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppStateBase, Store {
  Computed<AppLoginState>? _$loginStateComputed;

  @override
  AppLoginState get loginState =>
      (_$loginStateComputed ??= Computed<AppLoginState>(() => super.loginState,
              name: '_AppStateBase.loginState'))
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

  final _$pageColorAtom = Atom(name: '_AppStateBase.pageColor');

  @override
  MaterialColor get pageColor {
    _$pageColorAtom.reportRead();
    return super.pageColor;
  }

  @override
  set pageColor(MaterialColor value) {
    _$pageColorAtom.reportWrite(value, super.pageColor, () {
      super.pageColor = value;
    });
  }

  final _$isOnboardingAtom = Atom(name: '_AppStateBase.isOnboarding');

  @override
  bool get isOnboarding {
    _$isOnboardingAtom.reportRead();
    return super.isOnboarding;
  }

  @override
  set isOnboarding(bool value) {
    _$isOnboardingAtom.reportWrite(value, super.isOnboarding, () {
      super.isOnboarding = value;
    });
  }

  final _$hasWalletAtom = Atom(name: '_AppStateBase.hasWallet');

  @override
  bool get hasWallet {
    _$hasWalletAtom.reportRead();
    return super.hasWallet;
  }

  @override
  set hasWallet(bool value) {
    _$hasWalletAtom.reportWrite(value, super.hasWallet, () {
      super.hasWallet = value;
    });
  }

  final _$stateAtom = Atom(name: '_AppStateBase.state');

  @override
  AppCurrentState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppCurrentState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userAtom = Atom(name: '_AppStateBase.user');

  @override
  WalletUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(WalletUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$initAppAsyncAction = AsyncAction('_AppStateBase.initApp');

  @override
  Future<void> initApp() {
    return _$initAppAsyncAction.run(() => super.initApp());
  }

  final _$completeOnboardingAsyncAction =
      AsyncAction('_AppStateBase.completeOnboarding');

  @override
  Future<void> completeOnboarding() {
    return _$completeOnboardingAsyncAction
        .run(() => super.completeOnboarding());
  }

  final _$signInWithAppleAsyncAction =
      AsyncAction('_AppStateBase.signInWithApple');

  @override
  Future<void> signInWithApple() {
    return _$signInWithAppleAsyncAction.run(() => super.signInWithApple());
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_AppStateBase.signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInUserAsyncAction = AsyncAction('_AppStateBase.signInUser');

  @override
  Future<void> signInUser() {
    return _$signInUserAsyncAction.run(() => super.signInUser());
  }

  final _$signOutAsyncAction = AsyncAction('_AppStateBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$connectAsyncAction = AsyncAction('_AppStateBase.connect');

  @override
  Future<void> connect() {
    return _$connectAsyncAction.run(() => super.connect());
  }

  final _$_AppStateBaseActionController =
      ActionController(name: '_AppStateBase');

  @override
  void setPageColor(MaterialColor color) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction(
        name: '_AppStateBase.setPageColor');
    try {
      return super.setPageColor(color);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
channel: ${channel},
pageColor: ${pageColor},
isOnboarding: ${isOnboarding},
hasWallet: ${hasWallet},
state: ${state},
user: ${user},
loginState: ${loginState}
    ''';
  }
}
