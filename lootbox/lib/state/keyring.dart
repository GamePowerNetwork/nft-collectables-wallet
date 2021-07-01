import 'package:gamepower_wallet/common/constants/constants.dart';
import 'package:gamepower_wallet/data/model/channels/KeyringChannel.dart';
import 'package:gamepower_wallet/service/webView.service.dart';
import 'package:mobx/mobx.dart';

part 'keyring.g.dart';

class Keyring = KeyringBase with _$Keyring;

abstract class KeyringBase with Store {
  late WebViewService _webViewService;

  KeyringBase();

  @observable 
  KeyringChannel channel = KeyringChannel(name: kKeyringChannel);

  @computed 
  String get phrase => channel.phrase;


  @action 
  void requestPhrase() {
    channel.method = 'getPhrase';
    _webViewService.request(channel.toJson());
  }

  void onChannelData(Map<String, dynamic> json) {
    channel = KeyringChannel.fromJson(json);
  }

  void init(WebViewService webViewService) {
    _webViewService = webViewService;
    webViewService.subscribeToChannel(channel.name, onChannelData);
  }
}