import 'package:flutter/material.dart';
import '../constants.dart';

class CollectibleGridItem extends StatelessWidget {
  const CollectibleGridItem({
    Key? key,
    required String name,
  }) : _name = name, super(key: key);

  final String _name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(
        _name, 
        style: TextStyle(
          color: Colors.white),
        ),
    );
  }
}