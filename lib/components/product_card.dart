import 'package:KropStand/components/product_image.dart';
import 'package:KropStand/screens/product.dart';
import 'package:KropStand/utils/abbreviateUnit.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({ Key key, @required this.product }) : super(key: key);

  final Map<String, dynamic> product;

  /*
  final String id;
  final String imageURL;
  final String title;
  final double price;
  final String minimumOrder;
  final String unit;
  */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Product(id: product['ID']))
        ),
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProductImage(url: product["Image"]),
              SizedBox(height: 12),
              Text(product["Name"], style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 4),
              Row(
                children: <Widget>[
                  Text('\$${(product["Price"] / 100).toString()}', style: Theme.of(context).accentTextTheme.subtitle2),
                  Text(' • ${product["MinimumOrder"]} ${abbreviateUnit(product['PricingUnit'])}', style: Theme.of(context).textTheme.subtitle2)
                ],
              ),   
          ])));
  }
}