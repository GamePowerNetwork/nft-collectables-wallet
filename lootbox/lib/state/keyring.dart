import 'package:mobx/mobx.dart';

part 'keyring.g.dart';

class Keyring = KeyringBase with _$Keyring;

abstract class KeyringBase with Store {
  @observable 
  String phrase = '';

  @action 
  void setPhrase(_phrase) {
    phrase = _phrase;
  }
}