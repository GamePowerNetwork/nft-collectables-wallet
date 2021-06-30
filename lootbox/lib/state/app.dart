import 'package:gamepower_wallet/data/model/channels/AppChannel.dart';
import 'package:gamepower_wallet/service/webView.service.dart';
import 'package:mobx/mobx.dart';

import 'keyring.dart';

part 'app.g.dart';

class AppState = _AppStateBase with _$AppState;

enum AppCurrentState { initial, loading, ready }

abstract class _AppStateBase with Store {
  final WebViewService _webViewService;

  _AppStateBase(this._webViewService);

  @observable
  AppChannel channel = AppChannel(null);

  @computed 
  AppCurrentState get state {
    if(channel.data == 'loading') {
      return AppCurrentState.loading;
    } else if(channel.data == 'ready') {
      return AppCurrentState.ready;
    }

    return AppCurrentState.initial;
  }

  @action onChannelData(dynamic data) {
    AppChannel updated = AppChannel(data);
    channel = updated;
  }

  @action 
  Future<void> initApp(Keyring keyring) async {
    // Start loading app
    channel = AppChannel('loading');

    // Load services
    keyring.init(_webViewService);

    // App Channel
    channel.callback = onChannelData;
    _webViewService.subscribeToChannel(channel);
    await _webViewService.init();
  }
}