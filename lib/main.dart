import 'dart:convert';

import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/screens/account.dart';
import 'package:KropStand/screens/basket.dart';
import 'package:KropStand/screens/market.dart';
import 'package:KropStand/screens/merchants.dart';
import 'package:KropStand/screens/notifications.dart';
import 'package:KropStand/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

 

  final HttpLink httpLink = HttpLink(
    uri: 'http://localhost:8080/query',
  );

  final AuthLink authLink = AuthLink(
    /* getToken: () async {
       Response response = await post('http://localhost:8080/login', headers: {
        'authorization': 'Basic ' + base64Encode(utf8.encode('samuel.archibald00@gmail.com:starwars'))
        });
        return 'Bearer ${response.body}';
    }
    // OR
    //
    */  
    getToken: () => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNWViOGMxOGY3ZDQxYjYwYmE3MmRjOTViIiwiZXhwIjoxNTkzMzY2MDQ5LCJpYXQiOjE1OTMzNTE2NDl9.zrOBc1yKFS-Gkn9iPQjhclJVrEyxNM1R_tg3JH7Trps',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );


    // TODO: Make friendly if on tablet.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'KropStand',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: NavigationController(),
      ),
    );
  }
}

class NavigationController extends StatefulWidget {
  NavigationController({Key key}) : super(key: key);
  @override
  _NavigationControllerState createState() => new _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  final List<Widget> pages = [
    Market(
      key: PageStorageKey('Market'),
    ),
    Merchants(
      key: PageStorageKey('Merchants'),
    ),
    Basket(
      key: PageStorageKey('Basket'),
    ),
    Notifications(
      key: PageStorageKey('Notifications'),
    ),
    Account(
      key: PageStorageKey('Account'),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) => setState(() => _selectedIndex = index),
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(KsIcons.market), title: Text('Market')),
              BottomNavigationBarItem(
                  icon: Icon(KsIcons.location), title: Text('Merchants')),
              BottomNavigationBarItem(
                  icon: Icon(KsIcons.basket), title: Text('Basket')),
              BottomNavigationBarItem(
                  icon: Icon(KsIcons.notifications),
                  title: Text('Notifications')),
              BottomNavigationBarItem(
                  icon: Icon(KsIcons.user), title: Text('Account'))
            ],
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).unselectedWidgetColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 10));
  }
}
