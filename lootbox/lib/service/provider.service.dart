import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/service/web_view.service.dart';

class ProviderService {

  Future<dynamic> connect() async {
    InAppWebViewController controller = GetIt.I<WebViewService>().getController();

    final String functionBody = """
    let result = await window.Provider.connect();
    return result;
    """;

    var result = await controller.callAsyncJavaScript(
      functionBody: functionBody,
    );

    print(result?.value);

    return result?.value;
  }
}
