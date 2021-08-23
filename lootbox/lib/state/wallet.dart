import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/common/models/wallet_user.dart';
import 'package:lootbox_wallet/service/storage.service.dart';
import 'package:lootbox_wallet/service/wallet.service.dart';
import 'package:mobx/mobx.dart';

part 'wallet.g.dart';

class WalletState = WalletStateBase with _$WalletState;

abstract class WalletStateBase with Store {
  final WalletService _walletService = WalletService();

  WalletStateBase();

  @action 
  Future<void> registerWallet(String phrase) async {
    print("Registering Wallet: ${phrase}");
    final result = await _walletService.registerWallet(phrase);
    
    final WalletUser wallet = WalletUser(
      name: result["name"],
      address: result["address"],
      phrase: result["phrase"], 
    );

    await GetIt.I<StorageService>().setItem("wallet.name", wallet.name);
    await GetIt.I<StorageService>().setItem("wallet.address", wallet.address);
    await GetIt.I<StorageService>().setItem("wallet.phrase", wallet.phrase);
  }
}