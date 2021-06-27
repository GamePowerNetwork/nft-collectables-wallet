import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/CollectionGridItem.dart';
import 'package:gamepower_wallet/common/components/CustomPageRoute.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';
import 'package:gamepower_wallet/common/constants/constants.dart';
import 'package:gamepower_wallet/providers/collections_provider.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'package:provider/provider.dart';
import 'package:gamepower_wallet/pages/collectibles/collectibles.page.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(slivers: <Widget>[
        MainAppBar(
          context: context,
          title: 'Collections',
          color: context.watch<NetworkProvider>().selected?.color,
          icon: Icons.collections_sharp,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 8, bottom: 25),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: kGridPadding,
              crossAxisSpacing: kGridPadding,
              childAspectRatio: 0.95,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    CustomPageRoute(
                        builder: (context) => CollectiblesPage(
                              CollectiblesPageArguments(
                                  collection: context
                                      .watch<Collections>()
                                      .collections[index]),
                            )),
                  ),
                  child: CollectionGridItem(
                      collection:
                          context.watch<Collections>().collections[index]),
                );
              },
              childCount: context.watch<Collections>().collections.length,
            ),
          ),
        ),
      ]),
    );
  }
}