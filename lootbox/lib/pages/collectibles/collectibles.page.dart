import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/CollectibleGridItem.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';
import 'package:gamepower_wallet/common/models/Collectible.dart';
import 'package:gamepower_wallet/common/models/Collection.dart';
import 'package:gamepower_wallet/providers/collectibles_provider.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'package:provider/provider.dart';
import 'package:gamepower_wallet/common/constants/constants.dart';

class CollectiblesPage extends StatefulWidget {
  final CollectiblesPageArguments arguments;

  const CollectiblesPage(this.arguments);

  @override
  CollectiblesPageState createState() => CollectiblesPageState();
}

class CollectiblesPageState extends State<CollectiblesPage> {
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      context.read<Collectibles>().setCollectibles(collectibles);
    }();
  }

  Widget build(BuildContext context) {
    print(".... building collectibles ..... ");
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          MainAppBar(
            context: this.context,
            title: 'Collectibles',
            expandedHeight: 300.0,
            color: context.watch<NetworkProvider>().selected?.color,
            heroId: widget.arguments.collection?.id,
            backgroundImageUrl: widget.arguments.collection?.image,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
                left: kGridPadding,
                top: kGridPadding,
                right: kGridPadding,
                bottom: 35),
            sliver: Consumer<Collectibles>(
              builder: (_, value, __) => SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  mainAxisSpacing: kGridPadding,
                  crossAxisSpacing: kGridPadding,
                  childAspectRatio: 0.95,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CollectibleGridItem(
                        collectible:
                            value.collectibles[index]);
                  },
                  childCount: value.collectibles.length,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CollectiblesPageArguments {
  final Collection? collection;

  CollectiblesPageArguments({
    this.collection,
  });
}
