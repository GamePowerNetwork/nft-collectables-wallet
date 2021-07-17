import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/components/collectible_grid_item.dart';
import 'package:lootbox_wallet/common/components/page_base.dart';
import 'package:lootbox_wallet/common/models/collectible.dart';
import 'package:lootbox_wallet/common/models/collection.dart';
import 'package:lootbox_wallet/providers/collectibles_provider.dart';
import 'package:lootbox_wallet/providers/network_provider.dart';
import 'package:provider/provider.dart';
import 'package:lootbox_wallet/common/constants/constants.dart';

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
    return Scaffold(
      body: PageBase(
        pageOptions: PageBaseOptions(
          title: "Collectibles",
          headerHeight: 300.0,
          headerIcon: Icons.collections_sharp,
          pageColor: context.watch<NetworkProvider>().selected?.color ?? Colors.purple,
          headerHeroId: widget.arguments.collection?.id,
          headerBackgroundImage: widget.arguments.collection?.image,
          isSliverChild: true,
        ),
        child: SliverPadding(
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