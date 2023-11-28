import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/productscreen.dart';

import '../controller/provider/products_provider.dart';
import '../model/new_model.dart';
import 'favroite_screen.dart';

class SharedPrefrances extends StatefulWidget {
  const SharedPrefrances({super.key});

  @override
  State<SharedPrefrances> createState() => _SharedPrefrancesState();
}

class _SharedPrefrancesState extends State<SharedPrefrances> {
  // get provider => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    provider.getItems();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => FavScreen()),
          );
        },
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return provider.data == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: provider.data!.length,
                  itemBuilder: (context, index) {
                    var product = provider.data![index];
                    var isFavorite = provider.isProductFavorite(product);

                    return Card(
                      child: InkWell(
                        onDoubleTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: GridTile(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Price: \$${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Consumer<ProductProvider>(
                                      builder: (context, provider, _) {
                                        return InkWell(
                                          onTap: () {
                                            provider.toggleFavorite(product);
                                          },
                                          child: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color:
                                                isFavorite ? Colors.red : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
