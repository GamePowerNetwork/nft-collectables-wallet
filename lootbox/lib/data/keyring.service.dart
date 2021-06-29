abstract class KeyringService {
  Future<String> fetchPhrase();
  //Future<Keyring> fetchKeyring();
}

class FakeKeyringService implements KeyringService {

  @override 
  Future<String> fetchPhrase() {
    return Future.delayed(Duration(seconds: 1), () {
      return "this is a test of the keyring service";
    });
  }
}