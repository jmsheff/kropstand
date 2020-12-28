import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  ProductImage({ @required this.url, this.unrounded = false });

  final String url;
  final bool unrounded;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: FractionalOffset.topCenter,
              image: new NetworkImage(url),
            ),
            borderRadius: BorderRadius.all(unrounded ? Radius.zero : Radius.circular(8)),
          ),
        ));
  }
}