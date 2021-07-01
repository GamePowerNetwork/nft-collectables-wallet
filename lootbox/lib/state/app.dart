import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/constants/constants.dart';
import 'package:gamepower_wallet/data/model/channels/AppChannel.dart';
import 'package:gamepower_wallet/service/webView.service.dart';
import 'package:mobx/mobx.dart';

import 'keyring.dart';

part 'app.g.dart';

class AppState = _AppStateBase with _$AppState;

abstract class _AppStateBase with Store {
  final WebViewService _webViewService;

  _AppStateBase(this._webViewService);

  @observable
  AppChannel channel = AppChannel(name: kAppChannel);

  @observable
  MaterialColor pageColor = Colors.red;

  @computed 
  AppCurrentState get state => channel.state;

  void onChannelData(Map<String, dynamic> json) {
    channel = AppChannel.fromJson(json);
  }

  @action 
  Future<void> initApp(Keyring keyring) async {
    // Start loading app
    channel.state = AppCurrentState.loading;

    // Load services
    keyring.init(_webViewService);

    // App Channel
    _webViewService.subscribeToChannel(channel.name, onChannelData);
    await _webViewService.init();
  }

  @action 
  void setPageColor(MaterialColor color) {
    pageColor = color;
  }
}