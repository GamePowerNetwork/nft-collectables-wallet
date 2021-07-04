import 'package:mobx/mobx.dart';

part 'phrase.g.dart';

class PhraseState = PhraseStateBase with _$PhraseState;

abstract class PhraseStateBase with Store {
  final String phrases;

  PhraseStateBase(this.phrases);

  @observable 
  bool hasError = false;

  @observable
  bool isVerified = false;

  @observable 
  ObservableList<Map<String, dynamic>> verifiedPhrases = ObservableList<Map<String, dynamic>>();


  @action 
  void addWord(String word) {
    // Check if this word matches (position) in the phrases list
    int index = verifiedPhrases.length;

    // get the matching word from the provided phrases list
    List<String> wordList = phrases.split(" ");
    String correctWord = wordList[index];

    verifiedPhrases.add({
      "word": word,
      "valid": (correctWord == word)
    });

    if(correctWord != word) {
      hasError = true;
      return;
    }

    if(verifiedPhrases.length == wordList.length) {
      isVerified = true;
    }
  }

  @action 
  void resetPhrase() {
    verifiedPhrases = ObservableList<Map<String, dynamic>>();
    hasError = false;
  }
}