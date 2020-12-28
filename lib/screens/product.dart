import 'dart:ui';

import 'package:KropStand/components/button.dart';
import 'package:KropStand/utils/abbreviateUnit.dart';
import 'package:KropStand/components/expandable_text.dart';
import 'package:KropStand/components/merchant_card.dart';
import 'package:KropStand/components/product_image.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/queries/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Product extends StatelessWidget {
  final String id;

  Product({Key key, @required this.id}) : super(key: key);

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
          title: Text('Product'),
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
                documentNode: gql(productQuery), variables: {'id': id}),
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

              var data = result.data['getProductListing'];
              return CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: <Widget>[
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
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                SizedBox(height: 12),
                                Text(
                                  '\$${(data['Price'] / 100).toString()}',
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .subtitle1,
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: GlassButton(ButtonData(
                                      suffixIcon: Icons.arrow_drop_down,
                                      label:
                                          'Qty: ${data["MinimumOrder"]} ${abbreviateUnit(data['PricingUnit'])}',
                                      onPressed: () {},
                                    ))),
                                    SizedBox(width: 16),
                                    Expanded(
                                        child: GlassButton(ButtonData(
                                      prefixIcon: KsIcons.list_add,
                                      label: 'Add to list',
                                      onPressed: () {},
                                    )))
                                  ],
                                ),
                                SizedBox(height: 14),
                                SolidButton(ButtonData(
                                  prefixIcon: KsIcons.basket_add,
                                  label: 'Add to basket',
                                  onPressed: () {},
                                )),
                                SizedBox(height: 16),
                                ExpandableText(text: data['Description']),
                                SizedBox(height: 16),
                                MerchantCard(merchant: data['Merchant'])
                              ]),
                        )
                      ]),
                    )
                  ]);
            }));
  }
}
