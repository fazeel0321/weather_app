import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/controller/provider/preferences/preference.dart';
import '../../model/products_model.dart';

class FavouriteProvider extends ChangeNotifier {
  List<ProductsModel> favProducts = [];
  bool isLoading = false;

  Future<void> getFavourites() async {
    isLoading = true;
    notifyListeners();

    List<String> data = await PreferenceManager.getFavourites();
    favProducts =
        data.map((e) => ProductsModel.fromJson(jsonDecode(e))).toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addFavorite(ProductsModel product) async {
    if (!favProducts.contains(product)) {
      favProducts.add(product);
      await PreferenceManager.addFavorite(product);
      notifyListeners();
    }
  }

  Future<void> removeFavorite(ProductsModel product) async {
    if (favProducts.contains(product)) {
      favProducts.remove(product);
      await PreferenceManager.removeFavorite(product);
      notifyListeners();
    }
  }
}
