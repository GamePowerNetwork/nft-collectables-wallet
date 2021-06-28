import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';
import 'package:gamepower_wallet/common/components/api/api.provider.dart';
import 'package:provider/provider.dart';

class LootDropPage extends StatefulWidget {
  @override
  LootDropPageState createState() => LootDropPageState();
}

class LootDropPageState extends State<LootDropPage> {

  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      
    }();
  }

  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          MainAppBar(
            context: this.context,
            title: 'Loot Drops',
            expandedHeight: 300.0,
            color: Colors.deepOrange,
            icon: Icons.stars,
          ),
          SliverToBoxAdapter(
              child: Column(
            children: <Widget>[
              Consumer<ApiProvider>(
                builder: (_, api, __) => Text(api.response)
              ),
              ElevatedButton(child: Text("Press me"), onPressed: () => context.read<ApiProvider>().callApi(),)
            ],
          ))
        ]),
      ),
    );
  }
}
