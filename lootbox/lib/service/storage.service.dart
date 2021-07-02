import 'package:lootbox_wallet/service/webView.service.dart';

class StorageService {
  late WebViewService webViewService;

  Future<void> init(WebViewService _webService) async {
    webViewService = _webService;
  }

  Future<void> setItem(String key, dynamic value) async {
    await webViewService.setLocalStorage(key, value);
  }

  Future<dynamic> getItem(String key) async {
    return await webViewService.getLocalStorage(key);
  }

  Future<void> clear() async {
    await webViewService.clearLocalStorage();
  }
}
