import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/CollectionGridItem.dart';
import 'package:gamepower_wallet/common/components/CustomPageRoute.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';
import 'package:gamepower_wallet/common/constants/constants.dart';
import 'package:gamepower_wallet/providers/collections_provider.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'package:provider/provider.dart';
import 'collectibles.page.dart';

class CollectionsPage extends StatefulWidget {
  @override
  CollectionsPageState createState() => CollectionsPageState();
}

class CollectionsPageState extends State<CollectionsPage> {
  Widget build(BuildContext context) {
    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Collections",
        subTitle: context.watch<NetworkProvider>().selected?.name ?? '',
        headerIcon: Icons.collections_sharp,
        headerColor: context.watch<NetworkProvider>().selected?.color ?? Colors.purple,
        isSliverChild: true,
      ),
      child: SliverPadding(
          padding: const EdgeInsets.only(left: 8, bottom: 25),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: 40,
              crossAxisSpacing: kGridPadding,
              childAspectRatio: 0.95,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext _, int index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    CustomPageRoute(
                        builder: (_) => CollectiblesPage(
                              CollectiblesPageArguments(
                                  collection: context
                                      .read<Collections>()
                                      .collections[index]),
                            )),
                  ),
                  child: CollectionGridItem(
                      collection:
                          context.read<Collections>().collections[index]),
                );
              },
              childCount: context.watch<Collections>().collections.length,
            ),
          ),
        ),
      );
  }
}