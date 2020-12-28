import 'package:KropStand/components/basket_item.dart';
import 'package:KropStand/queries/userBasket.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Basket extends StatelessWidget {
  const Basket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Basket'),
        ),
        body: Query(
            options: QueryOptions(documentNode: gql(userBasketQuery)),
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

              return CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) {
                        return BasketItem(
                            item: result.data['user']['Basket']['Items']
                                [index]);
                      },
                              childCount: result
                                  .data['user']['Basket']['Items'].length)))
                ],
              );
            }));
  }
}
