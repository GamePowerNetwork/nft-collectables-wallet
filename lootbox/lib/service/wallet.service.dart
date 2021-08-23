import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/common/models/wallet_user.dart';
import 'package:lootbox_wallet/service/storage.service.dart';
import 'package:lootbox_wallet/service/web_view.service.dart';

class WalletService {

  Future<dynamic> createPhrase() async {
    InAppWebViewController controller = GetIt.I<WebViewService>().getController();

    final String functionBody = """
    let result = await window.Keyring.getPhrase();
    return result;
    """;

    var result = await controller.callAsyncJavaScript(
      functionBody: functionBody,
    );

    return result?.value;
  }


  Future<dynamic> registerWallet(String phrase) async {
    InAppWebViewController controller = GetIt.I<WebViewService>().getController();

    final String functionBody = """
    let result = await window.Keyring.createPair({phrase});
    return result;
    """;

    var result = await controller.callAsyncJavaScript(
      functionBody: functionBody,
      arguments: {'phrase': phrase}
    );

    print(result?.value);

    return result?.value;
  }

  Future<WalletUser> getWalletUser() async {
    final name = await GetIt.I<StorageService>().getItem("wallet.name");
    final address = await GetIt.I<StorageService>().getItem("wallet.address");
    final phrase = await GetIt.I<StorageService>().getItem("wallet.phrase");

    final user = WalletUser(
      name: (name != null) ? name : null,
      address: (address != null) ? address : null,
      phrase: (phrase != null) ? phrase : null,
    );

    return user;
  }
}
