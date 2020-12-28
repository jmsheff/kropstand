import 'package:KropStand/components/product_image.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/screens/merchant.dart';
import 'package:flutter/material.dart';

class MerchantCard extends StatelessWidget {
  final Map<String, dynamic> merchant;
  MerchantCard({Key key, @required this.merchant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Merchant(id: merchant['ID']))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: ProductImage(url: merchant['Image'])),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(merchant['Name'],
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline2),
                      SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Icon(KsIcons.location,
                              size: 16, color: Theme.of(context).primaryColor),
                          SizedBox(width: 4),
                          Text(merchant['Address'],
                          maxLines: 1,
                              style: Theme.of(context).textTheme.subtitle2)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Icon(KsIcons.chevron_right,
                    color: Theme.of(context).unselectedWidgetColor),
              ],
            )));
  }
}
