import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:lootbox_wallet/pages/wallet_setup/filter_phrase.component.dart';
import 'package:lootbox_wallet/state/phrase.dart';
import 'package:provider/provider.dart';

class Phrase extends StatefulWidget {
  final String phrase;
  final bool? scramble;
  final bool canSelect;
  final bool usePhraseState;
  final bool populateList;
  final Function? onError;

  Phrase({
    Key? key,
    required String this.phrase,
    this.scramble,
    this.canSelect = false,
    this.usePhraseState = false,
    this.populateList = false,
    this.onError,
  }) : super(key: key);

  @override
  _PhraseState createState() => _PhraseState();
}

class _PhraseState extends State<Phrase> {
  late PhraseState phraseState;
  late List<Map<String, dynamic>> verificationPhrases = [];
  late List<FilterPhrase> populatedList = [];
  late ReactionDisposer _phraseStateDisposer;

  List<FilterPhrase> _buildChips(List<String> phrases) {
    List<FilterPhrase> chips = [];

    // If there are no items, return an empty list
    if (phrases.length <= 1) return [];

    // Scramble if needed
    if (widget.scramble == true) {
      phrases.shuffle();
    }

    chips = phrases.map((word) {
      return FilterPhrase(
        label: word,
        canSelect: widget.canSelect,
        usePhraseState: widget.usePhraseState,
      );
    }).toList();

    return chips;
  }

  List<String> _toList(String phrase) {
    List<String> phrases = phrase.split(" ");
    // If there are no items, return an empty list
    if (phrases.length <= 1) return [];

    return phrases;
  }

  List<FilterPhrase> _buildFromMap() {
    List<FilterPhrase> chips = [];

    chips = verificationPhrases.map((wordMap) {
      return FilterPhrase(
        label: wordMap["word"],
        isValid: wordMap["valid"],
        canSelect: widget.canSelect,
        usePhraseState: widget.usePhraseState,
      );
    }).toList();
    
    return chips;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.populateList) {
      phraseState = Provider.of<PhraseState>(context);
      _phraseStateDisposer = autorun((_) {
        verificationPhrases = phraseState.verifiedPhrases;

        setState(() {
          populatedList = _buildFromMap();
        });
      });
    }
  }

  @override
  void dispose() {
    if (widget.populateList) {
      _phraseStateDisposer();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: (!widget.populateList)
            ? _buildChips(_toList(widget.phrase))
            : populatedList,
        spacing: 10,
      ),
    );
  }
}
