import 'package:flutter/material.dart';
import 'package:lootbox_wallet/providers/network_provider.dart';
import 'package:provider/provider.dart';
import 'package:lootbox_wallet/common/models/Collection.dart';

class CollectionGridItem extends StatelessWidget {
  const CollectionGridItem({
    Key? key,
    required Collection collection,
  })  : _collection = collection,
        super(key: key);

  final Collection _collection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 20,
            child: Card(
              elevation: 4,
              color: context
                  .watch<NetworkProvider>()
                  .selected
                  ?.color
                  ?.withAlpha(90),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(),
            ),
          ),
          Positioned(
            top: 15,
            left: 0,
            right: 5,
            bottom: 15,
            child: Card(
              elevation: 4,
              color: context
                  .watch<NetworkProvider>()
                  .selected
                  ?.color
                  ?.withAlpha(130),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 15,
            bottom: 10,
            child: Hero(
              tag: _collection.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  _collection.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
