import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/api/api.widget.dart';

enum ApiState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ApiProvider extends ChangeNotifier {

  ApiState _apiState = ApiState.Initial;
  ApiWidget? _apiWidget;
  String _response = '';

  ApiState get apiState => _apiState;
  ApiWidget? get apiWidget => _apiWidget;
  String get response => _response;

  void apiLoading() {
    _apiState = ApiState.Loading;
    notifyListeners();
  }

  void apiConnected() {
    _apiState = ApiState.Loaded;
    notifyListeners();
  }

  void setApi(ApiWidget api) {
    _apiWidget = api;
    notifyListeners();
  }

  void setResponse(String response) {
    _response = response;
    notifyListeners();
  }

  void callApi() {
    _apiWidget?.callApi();
  }
}