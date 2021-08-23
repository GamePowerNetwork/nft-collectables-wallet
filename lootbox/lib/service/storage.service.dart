import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/service/web_view.service.dart';

class StorageService {

  Future<void> setItem(String key, dynamic value) async {
    await GetIt.I<WebViewService>().setLocalStorage(key, value);
  }

  Future<dynamic> getItem(String key) async {
    return await GetIt.I<WebViewService>().getLocalStorage(key);
  }

  Future<void> clear() async {
    await GetIt.I<WebViewService>().clearLocalStorage();
  }
}
