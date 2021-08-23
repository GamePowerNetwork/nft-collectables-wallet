import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/common/constants/constants.dart';
import 'package:lootbox_wallet/data/model/channels/keyring_channel.dart';
import 'package:lootbox_wallet/service/wallet.service.dart';
import 'package:mobx/mobx.dart';

part 'keyring.g.dart';

class Keyring = KeyringBase with _$Keyring;

abstract class KeyringBase with Store {
  KeyringBase();

  @observable 
  KeyringChannel channel = KeyringChannel(name: kKeyringChannel);

  @observable 
  String phrase = "";


  @action 
  Future<void> requestPhrase() async {
    final result = await GetIt.I<WalletService>().createPhrase();
    phrase = result['phrase'];
  }

  void onChannelData(Map<String, dynamic> json) {
    channel = KeyringChannel.fromJson(json);
  }
}