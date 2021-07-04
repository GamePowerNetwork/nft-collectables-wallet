import 'package:flutter/material.dart';
import 'package:lootbox_wallet/state/phrase.dart';
import 'package:provider/provider.dart';

class FilterPhrase extends StatefulWidget {
  final String label;
  final bool canSelect;
  final bool usePhraseState;
  final bool isValid;
  FilterPhrase({
    Key? key, 
    required String this.label,
    this.canSelect = false,
    this.usePhraseState = false,
    this.isValid = true,
  }) : super(key: key);

  @override
  _FilterPhraseState createState() => _FilterPhraseState();
}

class _FilterPhraseState extends State<FilterPhrase> {
  var _isSelected = false;
  late PhraseState phraseState;

  @override
  Widget build(BuildContext context) {
    if(widget.usePhraseState)
    {
      phraseState = Provider.of<PhraseState>(context);
    }

    return (widget.canSelect) ? FilterChip(
        label: Text(widget.label),
        labelStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.deepPurple[100],
        disabledColor: Colors.deepPurple[100],
        selected: _isSelected,
        onSelected: (widget.canSelect) ? (selected) {
          if(_isSelected) return;

          setState(() {
            _isSelected = selected;
          });

          phraseState.addWord(widget.label);
        } : (selected) {},
        selectedColor: Colors.white,
      )
      :
      Chip(
        label: Text(widget.label),
        labelStyle: TextStyle(color: (widget.isValid) ? Colors.black : Colors.white),
        backgroundColor: (widget.isValid) ? Colors.white : Colors.redAccent,
      )
      ;
  }
}