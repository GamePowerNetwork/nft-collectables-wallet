import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/common/constants/constants.dart';
import 'package:lootbox_wallet/common/models/wallet_user.dart';
import 'package:lootbox_wallet/data/model/channels/app_channel.dart';
import 'package:lootbox_wallet/service/auth.service.dart';
import 'package:lootbox_wallet/service/provider.service.dart';
import 'package:lootbox_wallet/service/storage.service.dart';
import 'package:lootbox_wallet/service/wallet.service.dart';
import 'package:lootbox_wallet/service/web_view.service.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_core/firebase_core.dart';

part 'app.g.dart';

class AppState = _AppStateBase with _$AppState;

enum AppLoginState {
  loggedIn,
  loggedOut,
}

enum AppCurrentState {
  initial,
  loading,
  ready,
}

abstract class _AppStateBase with Store {

  _AppStateBase();

  @observable
  AppChannel channel = AppChannel(name: kAppChannel);

  @observable
  MaterialColor pageColor = Colors.red;

  @observable
  bool isOnboarding = false;

  @observable
  bool hasWallet = false;

  @observable
  AppCurrentState state = AppCurrentState.initial;

  @observable
  WalletUser user = WalletUser();

  @computed
  AppLoginState get loginState {
    if (user.address != null) {
      return AppLoginState.loggedIn;
    }

    return AppLoginState.loggedOut;
  }

  void onChannelData(Map<String, dynamic> json) async {
    channel = AppChannel.fromJson(json);

    print("onChannelData");

    if (channel.messageType == AppChannelMessageType.state) {
      // Ready State
      if(json["state"] == "ready") {
        // Check onboarding
        if (await GetIt.I<StorageService>().getItem("onboarding_complete") == null) {
          isOnboarding = true;
        } else {
          isOnboarding = !await GetIt.I<StorageService>().getItem("onboarding_complete");
        }

        // Check wallet account
        user = await GetIt.I<WalletService>().getWalletUser();

        // State is ready
        state = AppCurrentState.ready;
      }
    }
  }

  @action
  Future<void> initApp() async {
    print("Initializing the App");
    // Firebase
    await Firebase.initializeApp();

    // WebViewService
    await GetIt.I<WebViewService>().init();

    // Start loading app
    state = AppCurrentState.loading;
    print("App State is now loading");

    // App WebView Channel
    GetIt.I<WebViewService>().subscribeToChannel(channel.name, onChannelData);
  }

  @action
  void setPageColor(MaterialColor color) {
    pageColor = color;
  }

  @action
  Future<void> completeOnboarding() async {
    await GetIt.I<StorageService>().setItem("onboarding_complete", true);
    isOnboarding = false;
  }

  // SignIn Methods
  @action
  Future<void> signInWithApple() async {
    try {
      await GetIt.I<AuthService>().signInWithApple();
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> signInWithGoogle() async {
    try {
      await GetIt.I<AuthService>().signInWithGoogle();
    } catch (e) {
      print(e);
    }
  }

  @action 
  Future<void> signInUser() async {
    try {
      user = await GetIt.I<WalletService>().getWalletUser();
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> signOut() async {
    await GetIt.I<AuthService>().signOut();
  }

  @action 
  Future<void> connect() async {
    await GetIt.I<ProviderService>().connect();
  }
}
