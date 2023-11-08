import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final productData;

  ProductDetailScreen({this.productData});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productData != null
            ? widget.productData['title']
            : 'Product Detail'),
      ),
      body: widget.productData == null
          ? Center(
              child: Text('Product not found.'),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      widget.productData['image'] != null
                          ? Image.network(widget.productData['image'])
                          : Container(),
                      SizedBox(height: 16),
                      Text(widget.productData['title'] ?? ''),
                      SizedBox(height: 16),
                      Text(widget.productData['description'] ?? ''),
                      SizedBox(height: 16),
                      Text(
                          'Price: ${widget.productData['price'] != null ? widget.productData['price'].toString() : ''}'),
                      SizedBox(height: 16),
                      Text(
                          'Rating: ${widget.productData['rating'] != null ? widget.productData['rating']['rate'].toString() : ''}'),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
