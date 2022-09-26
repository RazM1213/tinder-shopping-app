import 'package:flutter/material.dart';
import 'package:tinder_shopping_app/utils/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover
          )
        ),
      )
    );
  }
}
