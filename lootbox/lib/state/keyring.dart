import 'package:gamepower_wallet/data/model/channels/KeyringChannel.dart';
import 'package:gamepower_wallet/service/webView.service.dart';
import 'package:mobx/mobx.dart';

part 'keyring.g.dart';

class Keyring = KeyringBase with _$Keyring;

abstract class KeyringBase with Store {

  KeyringBase();

  @observable 
  KeyringChannel channel = KeyringChannel();

  @action onChannelData(dynamic data) {
    KeyringChannel updated = KeyringChannel();
    updated.data = data;
    channel = updated;
  }

  @action init(WebViewService webViewService) {
    channel.callback = onChannelData;
    webViewService.subscribeToChannel(channel);
  }
}