import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/queries/userLists.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(KsIcons.back),
          ),
          automaticallyImplyLeading: false,
          title: Text('Lists'),
        ),
        body: Query(
            options: QueryOptions(documentNode: gql(userListsQuery)),
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

              var lists = result.data['user']['Lists'];
              return CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(padding: EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                      var list = lists[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(list['Name'], style: Theme.of(context).textTheme.headline2),
                          SizedBox(height: 4),
                          Text(list['Items'] == null
                              ? 'No products'
                              : '${list['Items'].length} product(s)', style: Theme.of(context).textTheme.subtitle2),
                          SizedBox(height: 16)
                        ],
                      );
                    }, childCount: lists.length ),
                  ))
                ],
              );
            }));
  }
}
