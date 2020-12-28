import 'package:KropStand/components/merchants_map.dart';
import 'package:KropStand/components/search_bar.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/queries/nearbyMerchants.dart';
import 'package:KropStand/screens/search.dart';
import 'package:KropStand/utils/getUserLocation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Merchants extends StatelessWidget {
  const Merchants({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var location = getUserLocation();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(KsIcons.merchant_heart),
            onPressed: () {},
          ),
          actions: <Widget>[IconButton(
            icon: Icon(KsIcons.message),
            onPressed: () {},
          )],
          title: Text('Merchants'),
          bottom: PreferredSize(child: Padding(
          padding: EdgeInsets.all(16),
          child: SearchBar(
            canRequestFocus: false,
            onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Search(initialIndex: 2))),
          )) , preferredSize: Size.fromHeight(48)),
        ),
        body: FutureBuilder(
          future: location,
          builder: (context, snapshot) {
          return Query(
              options: QueryOptions(documentNode: gql(nearbyMerchantsQuery)),
              builder: (QueryResult result,
                  {VoidCallback refetch, FetchMore fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                if (result.loading || !snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor)));
                }

                return MerchantsMap(
                  userLocation: snapshot.data,
                  merchants: result.data['nearbyMerchants'],
                );
              });
        }));
  }
}
