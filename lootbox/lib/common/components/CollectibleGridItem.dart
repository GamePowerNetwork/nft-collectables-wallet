import 'package:flutter/material.dart';
import 'package:gamepower_wallet/models/Collectible.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'package:provider/provider.dart';

class CollectibleGridItem extends StatelessWidget {
  const CollectibleGridItem({
    Key? key,
    required Collectible collectible,
  })  : _collectible = collectible,
        super(key: key);

  final Collectible _collectible;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Card(
              elevation: 2,
              color: context
                  .watch<NetworkProvider>()
                  .selected
                  ?.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
