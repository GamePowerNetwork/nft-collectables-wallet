import 'package:flutter/material.dart';
import '../common/constants.dart';
import '../common/components/CollectibleGridItem.dart';

class HomeScreen extends StatefulWidget {
  @override 
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _names = <String>['Mike', 'David', 'Sean', 'Alan', 'Craig', 'Chris', 'Mike', 'David', 'Sean', 'Alan', 'Craig', 'Chris', 'Mike', 'David', 'Sean', 'Alan', 'Craig', 'Chris'];

  Widget _buildList() {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: false,
            stretch: true,
            leadingWidth: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'GamePower Network',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Text('Collections'),
                    ],
                  ),
                ],
              ),
              titlePadding: EdgeInsets.all(kDefaultPadding),
              stretchModes: [StretchMode.fadeTitle],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(kDefaultPadding),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return CollectibleGridItem(name: _names[index]);
              }, 
              childCount: _names.length,
              ),
            ),
          ),
        ]
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {

            },
          ),
          Spacer(),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],),
      ),
      floatingActionButton:
        FloatingActionButton(child: Icon(Icons.qr_code), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _buildList(),
    );
  }
}