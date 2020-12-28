import 'package:KropStand/components/products_grid.dart';
import 'package:KropStand/components/quick_link.dart';
import 'package:KropStand/components/search_bar.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/queries/nearbyProducts.dart';
import 'package:KropStand/screens/lists.dart';
import 'package:KropStand/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Market extends StatelessWidget {
  const Market({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Icon(KsIcons.logo,
            color: Theme.of(context).primaryColor, size: 32.0),
      ),
      body: Query(
        options: QueryOptions(documentNode: gql(nearbyProductsQuery)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverList(
                    delegate: SliverChildListDelegate.fixed([
                  /* 
                -----------
                Search bar
                -----------
                */
                  SearchBar(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Search())),
                    canRequestFocus: false,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  /* 
                -----------
                Quick links 
                -----------
                */
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: QuickLink(
                            onPressed: () {},
                            iconData: KsIcons.orders,
                            label: 'My orders'),
                      ),
                      Expanded(
                          flex: 4,
                          child: QuickLink(
                              onPressed: () {},
                              iconData: KsIcons.merchant_heart,
                              label: 'My Merchants')),
                      Expanded(
                          flex: 3,
                          child: QuickLink(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Lists())),
                              iconData: KsIcons.list,
                              label: 'My Lists'))
                    ],
                  ),
                ])),
              ),
              /* 
                -----------
                Nearby Products
                -----------
              */
              !result.loading && !result.hasException
                  ? SliverPadding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      sliver:
                          ProductsGrid(products: result.data['nearbyListings']))
                  : SliverPadding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate.fixed([
                          Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor)))
                        ]),
                      ))
            ],
          );
        },
      ),
    );
  }
}
