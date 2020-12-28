import 'package:KropStand/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:KropStand/ks_icons_icons.dart';

class Search extends StatelessWidget {
  final int initialIndex;

  Search({ this.initialIndex = 0 });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: initialIndex,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(KsIcons.back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: false,
              titleSpacing: 0,
              title: Padding(
                padding: EdgeInsets.only(right: 16),
                child: SearchBar(
                  autoFocus: true
                )
              ),
              bottom: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
                tabs: [
                Tab(text: 'Products'),
                Tab(text: 'Categories'),
                Tab(text: 'Merchants'),
              ]),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    Text('Products')
                  ],
                ),
                ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    Text('Categories')
                  ],
                ),
                ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    Text('Merchants')
                  ],
                ),
              ],
            )));
  }
}
