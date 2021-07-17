import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/constants/constants.dart';
import 'package:lootbox_wallet/data/model/channels/app_channel.dart';
import 'package:lootbox_wallet/service/auth.service.dart';
import 'package:lootbox_wallet/service/storage.service.dart';
import 'package:lootbox_wallet/service/web_view.service.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_core/firebase_core.dart';

import 'keyring.dart';

part 'app.g.dart';

class AppState = _AppStateBase with _$AppState;

enum AppLoginState {
  loggedIn,
  loggedOut,
}

abstract class _AppStateBase with Store {
  final WebViewService _webViewService = WebViewService();
  final StorageService _storageService = StorageService();
  final AuthService _authService = AuthService();

  _AppStateBase();

  @observable
  AppChannel channel = AppChannel(name: kAppChannel);

  @observable
  MaterialColor pageColor = Colors.red;

  @observable
  bool isOnboarding = true;

  @observable
  bool hasWallet = false;

  @observable
  User? user;

  @computed
  AppLoginState get loginState {
    if (user?.uid != null) {
      print("LOGGED IN");
      return AppLoginState.loggedIn;
    }

    print("LOGGED OUT");
    return AppLoginState.loggedOut;
  }

  @computed
  AppCurrentState get state => channel.state;

  void onChannelData(Map<String, dynamic> json) async {
    channel = AppChannel.fromJson(json);

    if (channel.messageType == AppChannelMessageType.state) {
      // Check onboarding
      if (await _storageService.getItem("onboarding_complete") == null) {
        isOnboarding = true;
      } else {
        isOnboarding = !await _storageService.getItem("onboarding_complete");
      }

      // Check wallet
      if (await _storageService.getItem("wallet") == null) {
        hasWallet = false;
      } else if (await _storageService.getItem("wallet") != null) {
        hasWallet = true;
      }
    }
  }

  @action
  Future<void> initApp(Keyring keyring) async {
    // Firebase
    await Firebase.initializeApp();

    // Start loading app
    channel.state = AppCurrentState.loading;

    // Load services
    keyring.init(_webViewService);

    // Init Storage Service
    _storageService.init(_webViewService);

    // Auth Service
    _authService.init(_onAuthStateChange);

    // App WebView Channel
    _webViewService.subscribeToChannel(channel.name, onChannelData);
    await _webViewService.init();
  }

  @action
  void setPageColor(MaterialColor color) {
    pageColor = color;
  }

  @action
  Future<void> completeOnboarding() async {
    await _storageService.setItem("onboarding_complete", true);
    isOnboarding = false;
  }

  // SignIn Methods
  @action
  Future<void> signInWithApple() async {
    try {
      await _authService.signInWithApple();
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> signInWithGoogle() async {
    try {
      await _authService.signInWithGoogle();
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> signOut() async {
    await _authService.signOut();
  }

  void _onAuthStateChange(User? _user) {
    user = _user;
  }
}
