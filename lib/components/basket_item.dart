import 'package:KropStand/components/button.dart';
import 'package:KropStand/components/product_image.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:KropStand/screens/product.dart';
import 'package:KropStand/utils/abbreviateUnit.dart';
import 'package:flutter/material.dart';

class BasketItem extends StatelessWidget {
  BasketItem({Key key, @required this.item}) : super(key: key);
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    var product = item["Item"];
    return 
    Column(children: <Widget>[
      Container(
        height: 80,
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Product(id: product['ID']))),
                    child: Row(children: <Widget>[
                      ProductImage(url: product["Image"]),
                      SizedBox(width: 12),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(product["Name"],
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(height: 4),
                            Row(
                              children: <Widget>[
                                Text('\$${(product["Price"] / 100).toString()}',
                                    style: Theme.of(context)
                                        .accentTextTheme
                                        .subtitle2),
                                Text(
                                    ' • ${product["MinimumOrder"]} ${abbreviateUnit(product['PricingUnit'])}',
                                    style:
                                        Theme.of(context).textTheme.subtitle2)
                              ],
                            )
                          ])
                    ])),
                IconButton(
                  onPressed: () {},
                  icon: Icon(KsIcons.ellipsis),
                )
              ])),
              SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                  child: GlassButton(ButtonData(
                suffixIcon: Icons.arrow_drop_down,
                label:
                    'Qty: ${product["MinimumOrder"]} ${abbreviateUnit(product['PricingUnit'])}',
                onPressed: () {},
              ))),
              SizedBox(width: 16),
              Expanded(
                  child: GlassButton(ButtonData(
                      prefixIcon: KsIcons.delete,
                      label: 'Remove',
                      onPressed: () {},
              )))
            ],
          )
        ]);
  }
}
