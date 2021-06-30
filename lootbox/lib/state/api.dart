import 'package:gamepower_wallet/service/webView.service.dart';
import 'package:mobx/mobx.dart';

import 'keyring.dart';

part 'api.g.dart';

class ApiStore = ApiStoreBase with _$ApiStore;

enum ApiStoreState { initial, loading, loaded }

abstract class ApiStoreBase with Store {
  final WebViewService _webViewService;

  ApiStoreBase(this._webViewService);

  @observable 
  ApiStoreState state = ApiStoreState.initial;

  @observable
  String errorMessage = '';

  @action 
  void setState(ApiStoreState _state) {
    errorMessage = "leggo!";
    state = _state;
  }

  @action 
  void setApiError(String _error) {
    errorMessage = _error;
  }

  @action 
  Future<void> initApp(Keyring keyring) async {
    keyring.init(_webViewService);
    await _webViewService.init();
  }
}