import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider/favourite_provider.dart';
import '../controller/provider/products_provider.dart';
import '../model/new_model.dart';

class FavScreen extends StatefulWidget {
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false)
          .getFavoritesFromPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FavouriteProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.favProducts.isEmpty) {
            return Center(
              child: Text('No favorite products'),
            );
          } else {
            return ListView.builder(
              itemCount: provider.favProducts.length,
              itemBuilder: (context, index) {
                var favoriteProduct = provider.favProducts[index];
                return Card(
                  child: ListTile(
                    title: Text(favoriteProduct.title),
                    leading: Container(
                      width: 100,
                      child: Image.network(
                        favoriteProduct.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
