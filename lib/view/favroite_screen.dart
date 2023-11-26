import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/favourite_provider.dart';
import '../model/new_model.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavouriteProvider provider = context.read<FavouriteProvider>();
    provider.getFavourites();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FavouriteProvider>(builder: (context, provider, child) {
        return provider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : provider.favProducts == null || provider.favProducts!.isEmpty
                ? Center(
                    child: Text('No favorite products'),
                  )
                : ListView.builder(
                    itemCount: provider.favProducts!.length,
                    itemBuilder: (context, index) {
                      var favoriteProduct = provider.favProducts![index];
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
      }),
    );
  }
}
