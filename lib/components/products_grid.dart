import 'package:KropStand/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsGrid extends StatelessWidget {
  
  final List<dynamic> products;

  ProductsGrid({ Key key, @required this.products }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context);
    const minItemWidth = 175;
    return SliverStaggeredGrid.countBuilder(
            crossAxisCount:
                ((device.size.width - (device.size.width % minItemWidth)) /
                        minItemWidth)
                    .round(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard( product: products[index] );
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(1);
            },
          );
  }
}