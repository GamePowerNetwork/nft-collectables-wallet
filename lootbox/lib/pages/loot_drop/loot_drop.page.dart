import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';
import 'package:gamepower_wallet/common/components/api/api.model.dart';
import 'package:gamepower_wallet/common/components/api/api.notification.dart';
import 'package:gamepower_wallet/common/components/api/api.provider.dart';
import 'package:provider/provider.dart';

class LootDropPage extends StatefulWidget {
  @override
  LootDropPageState createState() => LootDropPageState();
}

class LootDropPageState extends State<LootDropPage> {
  Widget build(BuildContext context) {
    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Loot Drops",
        headerIcon: Icons.stars,
        headerColor: Colors.red,
      ),
      child: Column(
        children: <Widget>[
          Consumer<ApiProvider>(builder: (_, api, __) => Text(api.response)),
          ElevatedButton(
            child: Text("Press me"),
            onPressed: () => _callApi(),
          )
        ],
      ),
    );
  }

  _callApi() {
    RequestData request = RequestData("getPhrase", []);
    ApiRequestNotification(request).dispatch(context);
  }
}
