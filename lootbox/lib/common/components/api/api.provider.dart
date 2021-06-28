import 'package:flutter/material.dart';

enum ApiState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ApiProvider extends ChangeNotifier {

  ApiState _apiState = ApiState.Initial;
  String _response = '';

  ApiState get apiState => _apiState;
  String get response => _response;

  void apiLoading() {
    _apiState = ApiState.Loading;
    notifyListeners();
  }

  void apiConnected() {
    _apiState = ApiState.Loaded;
    notifyListeners();
  }

  void setResponse(String response) {
    _response = response;
    notifyListeners();
  }
}