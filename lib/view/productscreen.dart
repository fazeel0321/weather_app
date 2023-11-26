import 'package:flutter/material.dart';
import '../model/new_model.dart';
import '../model/products_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
              product.image,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
