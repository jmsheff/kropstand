import 'package:KropStand/components/button.dart';
import 'package:KropStand/components/expandable_text.dart';
import 'package:KropStand/components/product_image.dart';
import 'package:KropStand/components/products_grid.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/queries/merchant.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Merchant extends StatelessWidget {
  final String id;
  Merchant({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(KsIcons.back),
          ),
          title: Text('Merchant'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        height: 128,
                        child: ListView(itemExtent: 48, children: <Widget>[
                          ListTile(
                            leading: Icon(KsIcons.share),
                            title: Text('Share'),
                          ),
                          ListTile(
                            leading: Icon(KsIcons.flag),
                            title: Text('Report'),
                          ),
                        ])));
              },
              icon: Icon(KsIcons.ellipsis),
            ),
          ],
        ),
        body: Query(
            options: QueryOptions(
                documentNode: gql(merchantQuery), variables: {'id': id}),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.loading) {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor)));
              }

              var data = result.data['getMerchant'];
              return CustomScrollView(scrollDirection: Axis.vertical, slivers: <
                  Widget>[
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    ProductImage(
                      url: data['Image'],
                      unrounded: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data['Name'],
                                style: Theme.of(context).textTheme.headline1),
                            SizedBox(height: 12),
                            Row(
                              children: <Widget>[
                                Icon(KsIcons.location,
                                    size: 16,
                                    color: Theme.of(context).primaryColor),
                                SizedBox(width: 4),
                                Text(data['Address'],
                                    style:
                                        Theme.of(context).textTheme.subtitle2)
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: GlassButton(ButtonData(
                                        prefixIcon: KsIcons.message,
                                        label: 'Message',
                                        onPressed: () {}))),
                                SizedBox(width: 16),
                                Expanded(
                                    child: GlassButton(ButtonData(
                                  prefixIcon: KsIcons.heart,
                                  label: 'Favorite',
                                  onPressed: () {},
                                )))
                              ],
                            ),
                            SizedBox(height: 14),
                            SolidButton(ButtonData(
                              prefixIcon: KsIcons.directions,
                              label: 'Directions',
                              onPressed: () {},
                            )),
                            SizedBox(height: 16),
                            ExpandableText(text: data['Description']),
                            SizedBox(height: 16),
                            Row(children: <Widget>[
                              Text('Products',
                                  style: Theme.of(context).textTheme.headline2),
                              Text(' • ${data['ProductListings'].length}',
                                  style: Theme.of(context).textTheme.subtitle2)
                            ]),
                          ]),
                    )
                  ]),
                ),
                SliverPadding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    sliver: ProductsGrid(
                      products: data['ProductListings'],
                    ))
              ]);
            }));
  }
}
