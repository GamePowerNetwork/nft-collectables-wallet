import 'package:mobx/mobx.dart';

part 'api.g.dart';

class ApiStore = ApiStoreBase with _$ApiStore;

enum ApiStoreState { initial, loading, loaded }

abstract class ApiStoreBase with Store {
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
}